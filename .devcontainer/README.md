# DevContainer — Azure Migration Workshop

This devcontainer provides the complete environment for both running the
workshop and building the documentation site.

## What's Included

| Tool | Source | Purpose |
|---|---|---|
| Ruby + Jekyll | via base image | Documentation site generation |
| Node.js + npm | LTS | markdownlint-cli2 |
| Azure CLI (az) | Latest | Azure resource management |
| Bicep CLI | Latest | Infrastructure as Code |
| GitHub CLI (gh) | Latest | Repository and PR management |
| Python 3 + pip | 3.12 | Scripting utilities |
| PowerShell (pwsh) | 7.x | Workshop automation scripts |

VS Code extensions — Azure Bicep, Azure CLI Tools, PowerShell, Azure Resource
Groups, Markdown linting, YAML support, Mermaid preview.

## Getting Started

### 1. Open in DevContainer

In VS Code: `Ctrl+Shift+P` → **Dev Containers: Reopen in Container**

### 2. Start the Jekyll Dev Server

```sh
cd docs
bundle install
bundle exec jekyll serve
```

### 3. Preview the Site

Open <http://localhost:4000/microhack-azure-migrate/> in your browser (port 4000 is
auto-forwarded).

## Useful Commands

| Command | Purpose |
|---|---|
| `cd docs && bundle exec jekyll serve` | Start dev server with live reload |
| `cd docs && bundle exec jekyll build` | Build site without serving |
| `markdownlint-cli2 "docs/**/*.md"` | Lint all Markdown files |
| `cd docs && bundle exec htmlproofer _site/` | Check for broken links |
