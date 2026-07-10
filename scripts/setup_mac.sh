#!/usr/bin/env bash
# Bootstrap a fresh Mac with the basics. Mock helper — trim to taste.
set -euo pipefail

echo "==> Installing Homebrew (if missing)"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing CLI tools"
brew install git python@3.12 awscli terraform shellcheck jq

echo "==> Linking dotfiles"
DOTFILES="$(cd "$(dirname "$0")/../dotfiles" && pwd)"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"

echo "==> Done. Restart your shell."
