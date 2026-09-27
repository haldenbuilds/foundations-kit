#!/usr/bin/env python3
"""Structural admission gate for a Wizard_Build_Standard_v1 skeleton or cut.

Exit 0: clean. Exit 1: violations. Exit 3: instrument failure, never clean.
Every normal termination attempts to write _gate/gate-result.json and GATE-RESULT.md.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import sys
import tempfile
from dataclasses import asdict, dataclass
from pathlib import Path


EXIT_CLEAN = 0
EXIT_VIOLATIONS = 1
EXIT_INSTRUMENT_FAILED = 3
STAGE_IDS = [f"WB-{n}" for n in range(1, 6)]
TEMPLATE_FILES = {
    "manifest": "wizard.manifest.template.json",
    "wizard": "WIZARD.template.md",
    "interview": "interview.schema.template.json",
    "operator": "OPERATOR-GUIDE.template.md",
    "agent": "AGENT-GUIDE.template.md",
}
CUT_FILES = {key: value.replace(".template", "") for key, value in TEMPLATE_FILES.items()}


@dataclass
class Result:
    exit: int
    status: str
    mode: str
    root: str
    checks: int
    violations: list[str]
    instrument_error: str | None = None
    self_test: dict | None = None


def load_json(path: Path):
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise RuntimeError(f"cannot read valid JSON {path}: {exc}") from exc


def require(condition: bool, message: str, violations: list[str]):
    if not condition:
        violations.append(message)


def headings(path: Path) -> set[str]:
    try:
        return {line.strip() for line in path.read_text(encoding="utf-8").splitlines() if line.startswith("## ")}
    except OSError as exc:
        raise RuntimeError(f"cannot read {path}: {exc}") from exc


def check(root: Path, mode: str) -> tuple[int, list[str]]:
    files = TEMPLATE_FILES if mode == "template" else CUT_FILES
    violations: list[str] = []
    checks = 0
    paths = {key: root / name for key, name in files.items()}
    paths["gate"] = root / "gate-check.py"
    for key, path in paths.items():
        checks += 1
        require(path.is_file(), f"MISSING {key}: {path.name}", violations)
    if violations:
        return checks, violations

    manifest = load_json(paths["manifest"])
    checks += 1
    require(manifest.get("standard") == "Wizard_Build_Standard_v1", "MANIFEST standard pointer", violations)
    scope = manifest.get("scope", {})
    for key in ("classification", "packaged_boundary", "agentic_execution", "guided_transformation", "reason"):
        checks += 1
        require(bool(scope.get(key)), f"WB-0 scope.{key}", violations)
    checks += 1
    require(scope.get("classification") in ("IN_SCOPE", "SCOPE-UNRESOLVED"), "WB-0 classification value", violations)

    stages = manifest.get("stages", [])
    checks += 1
    require([stage.get("id") for stage in stages] == STAGE_IDS, "WB-1..WB-5 present once and ordered", violations)
    for expected, stage in zip(STAGE_IDS, stages):
        for key in ("name", "input", "activity", "receipt", "operator_gate"):
            checks += 1
            require(bool(stage.get(key)), f"{expected} missing {key}", violations)

    gates = manifest.get("operator_gates", [])
    checks += 1
    require([gate.get("id") for gate in gates] == [f"G{n}" for n in range(1, 6)], "G1..G5 present once and ordered", violations)
    for gate in gates:
        gid = gate.get("id", "G?")
        for key in ("decision", "subject", "record"):
            checks += 1
            require(bool(gate.get(key)), f"{gid} missing {key}", violations)
        checks += 2
        require(gate.get("owner") == "operator", f"{gid} owner must be operator", violations)
        require(gate.get("silence_is_approval") is False, f"{gid} silence must not approve", violations)

    guides = manifest.get("guides", {})
    for key in ("operator", "agent", "coverage_record", "help_invocation"):
        checks += 1
        require(bool(guides.get(key)), f"guides.{key}", violations)
    versions = manifest.get("versions", {})
    checks += 2
    require(versions.get("practice_only") is True, "three-version rule must be practice_only", violations)
    require(versions.get("operator_selects") is True, "operator must select version suitability", violations)

    interview = load_json(paths["interview"])
    checks += 4
    require(interview.get("$schema") == "https://json-schema.org/draft/2020-12/schema", "interview draft 2020-12", violations)
    require(interview.get("type") == "object", "interview root object", violations)
    floor_fields = {"general_idea", "intended_user", "defined_result", "operator_constraints", "known_unknowns", "success_evidence"}
    require(floor_fields.issubset(set(interview.get("required", []))), "interview floor fields required", violations)
    require(floor_fields.issubset(set(interview.get("properties", {}))), "interview floor properties present", violations)
    meta = interview.get("x-wizard", {})
    for key, expected in (("stage", "WB-1"), ("ratification_owner", "operator")):
        checks += 1
        require(meta.get(key) == expected, f"interview x-wizard.{key}", violations)
    for key in ("unknown_answer_policy", "specification_output", "ratification_record"):
        checks += 1
        require(bool(meta.get(key)), f"interview x-wizard.{key}", violations)

    required_headings = {
        "wizard": ["## Scope classification", *[f"## WB-{n} ·" for n in range(1, 6)], "## Operator approval boundary", "## Three-version practice", "## Receipts"],
        "operator": ["## Start here", "## What the wizard asks", "## Approval points", "## Resume and recover", "## Troubleshooting", "## Ask for help", "## Question coverage map", "## Limits"],
        "agent": ["## Invocation", "## Inputs", "## Stage protocol", "## Operator-only actions", "## Outputs", "## Failure behavior", "## Any-question help contract", "## Limits"],
    }
    for key, wanted in required_headings.items():
        actual = headings(paths[key])
        for heading in wanted:
            checks += 1
            if heading.endswith(" ·"):
                require(any(item.startswith(heading) for item in actual), f"{paths[key].name} heading {heading}...", violations)
            else:
                require(heading in actual, f"{paths[key].name} heading {heading}", violations)

    if mode == "cut":
        placeholder = re.compile(r"\{\{[^{}]+\}\}")
        for path in paths.values():
            if path.suffix not in (".md", ".json"):
                continue
            checks += 1
            require(not placeholder.search(path.read_text(encoding="utf-8")), f"UNRESOLVED-PLACEHOLDER {path.name}", violations)
    return checks, violations


def make_cut_fixture(source_root: Path, target: Path, source_files: dict[str, str]):
    for key, source_name in source_files.items():
        text = (source_root / source_name).read_text(encoding="utf-8")
        text = re.sub(r"\{\{[^{}]+\}\}", "fixture-value", text)
        (target / CUT_FILES[key]).write_text(text, encoding="utf-8")
    shutil.copy2(source_root / "gate-check.py", target / "gate-check.py")


def self_test(root: Path, mode: str) -> dict:
    outcomes = {}
    with tempfile.TemporaryDirectory(prefix="wizard-gate-selftest-") as tmp:
        base = Path(tmp)
        clean = base / "clean"
        clean.mkdir()
        source_files = TEMPLATE_FILES if mode == "template" else CUT_FILES
        make_cut_fixture(root, clean, source_files)
        _, clean_violations = check(clean, "cut")
        outcomes["must_accept_cut"] = len(clean_violations) == 0

        planted = base / "planted"
        shutil.copytree(clean, planted)
        (planted / "AGENT-GUIDE.md").unlink()
        _, planted_violations = check(planted, "cut")
        outcomes["planted_missing_guide_refused"] = any(item.startswith("MISSING agent") for item in planted_violations)

        broken = base / "broken"
        shutil.copytree(clean, broken)
        (broken / "wizard.manifest.json").write_text("{not-json\n", encoding="utf-8")
        try:
            check(broken, "cut")
            outcomes["broken_instrument_path_is_3"] = False
        except RuntimeError:
            outcomes["broken_instrument_path_is_3"] = True
    outcomes["passed"] = all(outcomes.values())
    return outcomes


def write_result(result: Result, result_dir: Path):
    result_dir.mkdir(parents=True, exist_ok=True)
    data = asdict(result)
    (result_dir / "gate-result.json").write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Wizard gate result",
        "",
        f"- Status: `{result.status}`",
        f"- Exit: `{result.exit}`",
        f"- Mode: `{result.mode}`",
        f"- Checks: `{result.checks}`",
        f"- Violations: `{len(result.violations)}`",
    ]
    if result.instrument_error:
        lines.append(f"- Instrument error: `{result.instrument_error}`")
    if result.self_test is not None:
        lines.extend(["", "## Embedded controls", ""])
        lines.extend(f"- {key}: `{value}`" for key, value in result.self_test.items())
    if result.violations:
        lines.extend(["", "## Violations", ""])
        lines.extend(f"- {item}" for item in result.violations)
    (result_dir / "GATE-RESULT.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--mode", choices=("template", "cut"), required=True)
    parser.add_argument("--result-dir", type=Path)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args(argv)
    result_dir = args.result_dir or args.root / "_gate"
    try:
        checks, violations = check(args.root, args.mode)
        controls = self_test(args.root, args.mode) if args.self_test else None
        if controls is not None and not controls["passed"]:
            violations.append("SELF-TEST embedded controls did not all pass")
        code = EXIT_CLEAN if not violations else EXIT_VIOLATIONS
        status = "CLEAN" if code == 0 else "VIOLATIONS"
        result = Result(code, status, args.mode, str(args.root), checks, violations, self_test=controls)
    except Exception as exc:
        result = Result(EXIT_INSTRUMENT_FAILED, "INSTRUMENT-FAILED", args.mode, str(args.root), 0, [], str(exc))
    try:
        write_result(result, result_dir)
    except Exception as exc:
        print(f"wizard-gate: INSTRUMENT-FAILED could not write result: {exc}", file=sys.stderr)
        return EXIT_INSTRUMENT_FAILED
    print(f"wizard-gate: {result.status} checks={result.checks} violations={len(result.violations)} result={result_dir}")
    return result.exit


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
