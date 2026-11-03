#!/usr/bin/env bash
# Installeer de skills als persoonlijke Claude Code-skills (macOS/Linux).
# Gebruik: ./install.sh [doelmap]   (standaard: ~/.claude/skills)
set -euo pipefail
src="$(cd "$(dirname "$0")" && pwd)/skills"
dest="${1:-${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills}"
backup="$(dirname "$dest")/skill-backups"
mkdir -p "$dest"
for dir in "$src"/*/; do
  name="$(basename "$dir")"
  [ -f "$dir/SKILL.md" ] || { echo "Missing skill: $name" >&2; exit 1; }
  if [ -e "$dest/$name" ]; then
    mkdir -p "$backup"
    mv "$dest/$name" "$backup/$name-$(date +%Y%m%d%H%M%S)"
    echo "Backed up $name"
  fi
  cp -R "$dir" "$dest/$name"
  echo "Installed $name"
done
