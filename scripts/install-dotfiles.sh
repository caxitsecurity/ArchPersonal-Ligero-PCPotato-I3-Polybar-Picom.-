#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%F_%H-%M-%S)"

mkdir -p "$BACKUP_DIR" "$HOME/.config"

backup_path() {
  local target="$1"
  if [[ -e "$target" || -L "$target" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${target#$HOME/}")"
    cp -a "$target" "$BACKUP_DIR/${target#$HOME/}"
    echo "BACKUP: $target -> $BACKUP_DIR/${target#$HOME/}"
  fi
}

install_dir() {
  local src="$1"
  local dst="$2"

  if [[ -d "$src" ]]; then
    backup_path "$dst"
    rm -rf "$dst"
    mkdir -p "$(dirname "$dst")"
    cp -a "$src" "$dst"
    echo "OK: $src -> $dst"
  else
    echo "SKIP: no existe $src"
  fi
}

install_file() {
  local src="$1"
  local dst="$2"

  if [[ -f "$src" ]]; then
    backup_path "$dst"
    mkdir -p "$(dirname "$dst")"
    cp -a "$src" "$dst"
    echo "OK: $src -> $dst"
  else
    echo "SKIP: no existe $src"
  fi
}

# Config principal
install_dir "$REPO_DIR/config/i3" "$HOME/.config/i3"
install_dir "$REPO_DIR/config/polybar" "$HOME/.config/polybar"
install_dir "$REPO_DIR/config/picom" "$HOME/.config/picom"
install_dir "$REPO_DIR/config/rofi" "$HOME/.config/rofi"
install_dir "$REPO_DIR/config/alacritty" "$HOME/.config/alacritty"
install_dir "$REPO_DIR/config/kitty" "$HOME/.config/kitty"
install_dir "$REPO_DIR/config/fastfetch" "$HOME/.config/fastfetch"
install_file "$REPO_DIR/config/starship.toml" "$HOME/.config/starship.toml"

# Home dotfiles
install_file "$REPO_DIR/home/.zshrc" "$HOME/.zshrc"
install_file "$REPO_DIR/home/.bashrc" "$HOME/.bashrc"
install_file "$REPO_DIR/home/.xinitrc" "$HOME/.xinitrc"
install_file "$REPO_DIR/home/.Xresources" "$HOME/.Xresources"
install_dir "$REPO_DIR/home/.screenlayout" "$HOME/.screenlayout"

cat <<EOF

Listo.

Se creó un respaldo previo en:
  $BACKUP_DIR

Para aplicar cambios en i3:
  Mod+Shift+R

Si algo sale mal, puedes recuperar tus archivos desde el respaldo.
EOF
