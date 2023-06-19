#!/bin/bash

set -eu

export PATH="$HOME/.bin/:$PATH"

export EDITOR=code

# https://github.com/sharkdp/bat
alias cat='bat'

# https://github.com/ogham/exa
alias ls='exa --git --icons --classify --group --color-scale --group-directories-first'
alias ll='exa --header --long --git --icons --classify --group --color-scale --group-directories-first'
