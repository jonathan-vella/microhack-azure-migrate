---
description: "Prevents terminal heredoc file corruption by requiring file editing tools"
applyTo: "**"
---

# No Heredoc Rule

Do not use terminal heredocs (`cat <<EOF`, `tee <<EOF`) to create or edit repository files.

Use file editing tools instead so changes remain safe, reviewable, and deterministic.
