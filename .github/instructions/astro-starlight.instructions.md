---
description: "Astro Starlight site conventions for the workshop documentation site"
applyTo: "site/**"
---

# Astro Starlight Conventions

This workshop site uses Astro v6 with the Starlight documentation theme.

## Site Structure

- Config: `site/astro.config.mjs` (Starlight integration, sidebar, base path).
- Content: `site/src/content/docs/` with auto-generated sidebar sections.
- Styles: `site/src/styles/custom.css` for theme overrides.
- Components: `site/src/components/` for Starlight component overrides.

## Rules

- Use the Astro Docs MCP server (`.vscode/mcp.json`) to verify current API usage before making Astro or Starlight changes.
- Prefer Starlight built-in features (frontmatter options, components) over custom implementations.
- Keep `astro.config.mjs` minimal; avoid unnecessary integrations.
- Use Markdown/MDX content collections, not standalone `.astro` pages for docs.
- Preserve `base` and `trailingSlash` config for GitHub Pages deployment.
- Test with `npm run dev` inside `site/` and verify build with `npm run build`.
