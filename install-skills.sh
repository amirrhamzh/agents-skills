#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.agents/skills"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: '$1' tidak ditemukan. Instal '$1' terlebih dahulu lalu jalankan ulang skrip ini." >&2
    exit 1
  fi
}

require_cmd git
require_cmd npm

if ! command -v python3 >/dev/null 2>&1 && ! command -v python >/dev/null 2>&1; then
  echo "Peringatan: Python 3 tidak terdeteksi. Skill UI/UX Pro Max memerlukan Python 3 saat dijalankan."
fi

mkdir -p "$SKILLS_DIR"

echo "[1/7] Menginstal farmage/opencode-skills..."
git clone --depth 1 https://github.com/farmage/opencode-skills.git "$TMP_DIR/opencode-skills"
cp -R "$TMP_DIR/opencode-skills/skills/." "$SKILLS_DIR/"

echo "[2/7] Menginstal UI/UX Pro Max..."
npm install -g ui-ux-pro-max-cli
uipro init --ai universal --global

echo "[3/7] Menginstal emilkowalski/skills..."
git clone --depth 1 https://github.com/emilkowalski/skills.git "$TMP_DIR/emilkowalski-skills"
cp -R "$TMP_DIR/emilkowalski-skills/skills/." "$SKILLS_DIR/"

echo "[4/7] Menginstal Cloudflare Security Audit..."
git clone --depth 1 https://github.com/cloudflare/security-audit-skill.git "$TMP_DIR/security-audit-skill"
cp -R "$TMP_DIR/security-audit-skill/skills/security-audit" "$SKILLS_DIR/"

echo "[5/7] Menginstal obra/superpowers..."
git clone --depth 1 https://github.com/obra/superpowers.git "$TMP_DIR/superpowers"
cp -R "$TMP_DIR/superpowers/skills/." "$SKILLS_DIR/"

echo "[6/7] Menginstal dietrichgebert/ponytail..."
PONYTAIL_DIR="$TMP_DIR/ponytail"
git clone --depth 1 https://github.com/dietrichgebert/ponytail.git "$PONYTAIL_DIR"
if [ -d "$PONYTAIL_DIR/skills" ]; then
  cp -R "$PONYTAIL_DIR/skills/." "$SKILLS_DIR/"
elif [ -f "$PONYTAIL_DIR/SKILL.md" ]; then
  mkdir -p "$SKILLS_DIR/ponytail"
  for item in "$PONYTAIL_DIR"/* "$PONYTAIL_DIR"/.*; do
    base="$(basename "$item")"
    [ "$base" = "." ] || [ "$base" = ".." ] || [ "$base" = ".git" ] || [ "$base" = "AGENTS.md" ] && continue
    [ -e "$item" ] && cp -R "$item" "$SKILLS_DIR/ponytail/"
  done
else
  while IFS= read -r skill_file; do
    skill_folder="$(dirname "$skill_file")"
    if [ "$skill_folder" != "$PONYTAIL_DIR" ]; then
      cp -R "$skill_folder" "$SKILLS_DIR/"
    fi
  done < <(find "$PONYTAIL_DIR" -name "SKILL.md" -not -path "*/.git/*")
fi

echo "[7/7] Menginstal amirrhamzh/agents-skills & AGENT_EFFICIENCY.md..."
SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/skills" ] && [ -f "$SCRIPT_DIR/AGENT_EFFICIENCY.md" ]; then
  REPO_DIR="$SCRIPT_DIR"
else
  REPO_DIR="$TMP_DIR/agents-skills"
  git clone --depth 1 https://github.com/amirrhamzh/agents-skills.git "$REPO_DIR"
fi

cp -R "$REPO_DIR/skills/." "$SKILLS_DIR/"

ANTIGRAVITY_RULES_DIR="$HOME/.gemini/config/rules"
OPENCODE_DIR="$HOME/.config/opencode"
mkdir -p "$ANTIGRAVITY_RULES_DIR" "$OPENCODE_DIR"

EFFICIENCY_SRC="$REPO_DIR/AGENT_EFFICIENCY.md"

# OpenCode global rules
cp "$EFFICIENCY_SRC" "$OPENCODE_DIR/AGENTS.md"

# Antigravity global rules (otomatis tambahkan frontmatter trigger: always_on jika belum ada)
if head -n 5 "$EFFICIENCY_SRC" | grep -q "trigger:[[:space:]]*always_on"; then
  cp "$EFFICIENCY_SRC" "$ANTIGRAVITY_RULES_DIR/AGENT_EFFICIENCY.md"
else
  {
    printf '%s\n' "---"
    printf '%s\n' "trigger: always_on"
    printf '%s\n\n' "---"
    cat "$EFFICIENCY_SRC"
  } > "$ANTIGRAVITY_RULES_DIR/AGENT_EFFICIENCY.md"
fi

echo ""
echo "Semua skill berhasil diinstal ke: $SKILLS_DIR"

# Otomatis jalankan setup-symlinks.sh agar cukup 1x jalan
if [ -f "$REPO_DIR/setup-symlinks.sh" ]; then
  echo ""
  echo "Menjalankan setup-symlinks.sh secara otomatis..."
  bash "$REPO_DIR/setup-symlinks.sh"
else
  echo "Langkah berikutnya: jalankan ./setup-symlinks.sh untuk menghubungkan ke OpenCode & Antigravity."
fi
