#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$REPO_DIR/config" "$REPO_DIR/home"

copy_dir() {
  local src="$1"
  local dst="$2"

  if [[ -d "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    rm -rf "$dst"
    cp -a "$src" "$dst"
    echo "OK: $src -> $dst"
  else
    echo "SKIP: no existe $src"
  fi
}

copy_file() {
  local src="$1"
  local dst="$2"

  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    cp -a "$src" "$dst"
    echo "OK: $src -> $dst"
  else
    echo "SKIP: no existe $src"
  fi
}

# Config principal
copy_dir "$HOME/.config/i3" "$REPO_DIR/config/i3"
copy_dir "$HOME/.config/polybar" "$REPO_DIR/config/polybar"
copy_dir "$HOME/.config/picom" "$REPO_DIR/config/picom"
copy_dir "$HOME/.config/rofi" "$REPO_DIR/config/rofi"
copy_dir "$HOME/.config/alacritty" "$REPO_DIR/config/alacritty"
copy_dir "$HOME/.config/kitty" "$REPO_DIR/config/kitty"
copy_dir "$HOME/.config/fastfetch" "$REPO_DIR/config/fastfetch"
copy_file "$HOME/.config/starship.toml" "$REPO_DIR/config/starship.toml"

# Home dotfiles
copy_file "$HOME/.zshrc" "$REPO_DIR/home/.zshrc"
copy_file "$HOME/.bashrc" "$REPO_DIR/home/.bashrc"
copy_file "$HOME/.xinitrc" "$REPO_DIR/home/.xinitrc"
copy_file "$HOME/.Xresources" "$REPO_DIR/home/.Xresources"
copy_dir "$HOME/.screenlayout" "$REPO_DIR/home/.screenlayout"

# Lista de paquetes instalados explícitamente desde pacman
if command -v pacman >/dev/null 2>&1; then
  pacman -Qqe | sort > "$REPO_DIR/scripts/pacman-explicit-packages.txt"
  echo "OK: lista de paquetes guardada en scripts/pacman-explicit-packages.txt"
fi

cat <<'EOF'

Listo.

Ahora revisa antes de subir:
  git status
  git diff

Luego:
  git add .
  git commit -m "sync: actualizar dotfiles Arch i3"
  git push
EOF
