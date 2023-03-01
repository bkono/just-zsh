#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

CUR=${0:a:h}
source "$CUR/functions.zsh"
source "$CUR/aliases.zsh"
