#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$HOME/.agents/skills"
mkdir -p "$TARGET_DIR"

IS_WINDOWS=false
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) IS_WINDOWS=true ;;
esac

LINK_PATHS=(
  "$HOME/.config/opencode/skills"
  "$HOME/.gemini/config/skills"
)

for LINK_PATH in "${LINK_PATHS[@]}"; do
  mkdir -p "$(dirname "$LINK_PATH")"

  if [ -L "$LINK_PATH" ]; then
    if [ "$IS_WINDOWS" = true ]; then
      WIN_LINK="$(cygpath -w "$LINK_PATH")"
      cmd //c rmdir "$WIN_LINK" >/dev/null 2>&1 || rm "$LINK_PATH"
    else
      rm "$LINK_PATH"
    fi
  elif [ -e "$LINK_PATH" ]; then
    BACKUP_PATH="${LINK_PATH}.backup-$(date +%Y%m%d-%H%M%S)"
    mv "$LINK_PATH" "$BACKUP_PATH"
    echo "Folder lama dipindahkan ke: $BACKUP_PATH"
  fi

  if [ "$IS_WINDOWS" = true ]; then
    WIN_LINK="$(cygpath -w "$LINK_PATH")"
    WIN_TARGET="$(cygpath -w "$TARGET_DIR")"
    cmd //c mklink //J "$WIN_LINK" "$WIN_TARGET" >/dev/null
    echo "Junction aktif: $LINK_PATH -> $TARGET_DIR"
  else
    ln -s "$TARGET_DIR" "$LINK_PATH"
    echo "Symlink aktif: $LINK_PATH -> $TARGET_DIR"
  fi
done

echo ""
echo "Selesai! Restart OpenCode / Antigravity agar semua skill terbaca."