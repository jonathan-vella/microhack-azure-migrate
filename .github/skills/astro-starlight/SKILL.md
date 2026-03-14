---
name: astro-starlight
description: Guides Astro Starlight site changes using current docs via the Astro MCP server.
---

# Astro Starlight Skill

## When to Use

- Modify `site/astro.config.mjs` (sidebar, integrations, theme config)
- Add or restructure content collections under `site/src/content/docs/`
- Override Starlight components in `site/src/components/`
- Update custom styles in `site/src/styles/custom.css`
- Troubleshoot Astro build or dev server issues

## Required Context

- `site/astro.config.mjs`
- `site/package.json`
- `.github/instructions/astro-starlight.instructions.md`
- Astro Docs MCP server for current API reference

## Workflow

1. Read the current site config and relevant content files.
2. Use the Astro Docs MCP server (`search_astro_docs`) to verify APIs, component props, and config options are current.
3. Apply changes following Starlight conventions.
4. Validate with `npm run build` inside `site/`.

## Constraints

- Do not add integrations without verifying compatibility via `astro add`.
- Preserve `base: "/microhack-azure-migrate"` and `trailingSlash: "always"` for GitHub Pages.
- Keep the site focused on workshop content; avoid unrelated features.
- Content changes must respect audience separation (participant vs facilitator).
