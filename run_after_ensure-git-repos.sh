#!/bin/sh
set -eu

ensure_git_repo() {
  dest="$1"
  url="$2"

  if [ -d "${dest}/.git" ]; then
    return 0
  fi

  if [ -e "${dest}" ]; then
    echo "chezmoi: ${dest} exists but is not a git repo; skipping ${url}" >&2
    return 0
  fi

  mkdir -p "$(dirname "${dest}")"
  git clone --depth 1 "${url}" "${dest}"
}

ensure_git_repo \
  "${HOME}/.config/alacritty/themes" \
  "https://github.com/alacritty/alacritty-theme.git"

ensure_git_repo \
  "${HOME}/.tmux/plugins/tpm" \
  "https://github.com/tmux-plugins/tpm.git"

if [ -x "${HOME}/.tmux/plugins/tpm/bin/install_plugins" ]; then
  "${HOME}/.tmux/plugins/tpm/bin/install_plugins"
fi
