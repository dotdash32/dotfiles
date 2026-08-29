#!/bin/sh
# Trim trailing newline from tmux selection, load into tmux buffer,
# and emit OSC 52 to the client terminal for system clipboard.

trimmed=$(perl -0777 -pe 's/\n\z//')

# store in tmux paste buffer (for prefix+])
printf '%s' "$trimmed" | tmux load-buffer -

# emit OSC 52 directly to the client terminal
b64=$(printf '%s' "$trimmed" | base64 | tr -d '\n')
printf '\033]52;c;%s\a' "$b64" > "$(tmux display-message -p '#{client_tty}')"
