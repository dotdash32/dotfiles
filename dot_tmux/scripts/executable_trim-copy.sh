#!/bin/sh
# Trim trailing newline from tmux selection, load into tmux buffer,
# and emit OSC 52 directly to the terminal for system clipboard.

trimmed=$(perl -0777 -pe 's/\n\z//')

# store in tmux paste buffer (for prefix+])
printf '%s' "$trimmed" | tmux load-buffer -

# emit OSC 52 wrapped in tmux passthrough to reach the outer terminal
b64=$(printf '%s' "$trimmed" | base64 | tr -d '\n')
printf '\ePtmux;\e\033]52;c;%s\a\e\\' "$b64" > /dev/tty
