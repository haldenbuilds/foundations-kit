# Foundations Kit by HaldenBuilds

Strategy before automation.

A kit your AI agent works from. It opens with The Operator Check: a few quick questions from your business records, the one thing holding the business back right now, and your next four-week plan. 10 questions, about 5 minutes. Or skip straight to the kit.

## Get it

1. Download the kit: [foundations-kit.zip](https://github.com/haldenbuilds/foundations-kit/releases/latest/download/foundations-kit.zip)
2. Unzip it. You get one folder holding `KIT-MANIFEST.md` and the `KIT` folder.

## Start here

1. Open the AI agent you use.
2. Give it the unzipped folder, the one that holds `KIT-MANIFEST.md` and the `KIT` folder.
3. Paste this one line:

   `Read KIT-MANIFEST.md in this folder and follow its notice to the recipient's agent.`

**What your agent must be able to do:** read files in this folder, write files in this folder, and run a command and show you what it printed and its exit code. An agent that can only read can still answer questions from the kit, but it cannot run the kit's checks (`KIT/B07`) or its backup test (`KIT/B12`), and it must report those as UNAVAILABLE, never as passed.

## Use and sharing

Use this kit freely in your business, including with your team. You may pass it on to anyone, as long as you pass on the whole kit, unchanged, with this section and its credit line in place.

**Credit:** Foundations Kit by HaldenBuilds. Strategy before automation. Get the latest version free: @haldenbuilds on Instagram
