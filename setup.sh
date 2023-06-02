#!/bin/bash

set -eu

# Color
BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"
# -----

# Create binary dir
BIN_DIR=$HOME/.bin/
mkdir -p $BIN_DIR
# -----------------

function test_command {
  if command -v $1 >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

function echo_installed {
  echo "${GREEN}Installed:${NO_COLOR} $1"
}

function setup_node {
  if test_command volta ; then
    echo_installed "volta $(volta --version)"
  else
    curl https://get.volta.sh | bash
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
  fi

  if test_command node ; then
    echo_installed "node $(node --version)"
  else
    volta install node
    volta install pnpm
  fi
}

function setup_rust {
  if test_command cargo ; then
    echo_installed "$(cargo --version)"
    return 0
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
}

function setup_cli {
  if test_command btm ; then
    echo_installed "$(btm --version)"
  else
    cargo install bottom --locked
  fi

  if test_command tokei ; then
    echo_installed "$(tokei --version)"
  else
    cargo install tokei
  fi

  if test_command exa ; then
    echo_installed "exa $(exa --version | grep -E "[0-9]+\.[0-9]+\.[0-9]+")"
  else
    cargo install exa
  fi

  if test_command fd ; then
    echo_installed "$(fd --version)"
  else
    cargo install fd-find
  fi

  if test_command starship ; then
    echo_installed "$(starship --version | grep -E "starship [0-9]+\.[0-9]+\.[0-9]+")"
  else
    curl -sS https://starship.rs/install.sh | sh -s -- -b $BIN_DIR
  fi
}

# Install cli tools
npm i -g pnpm taze rimraf tsx
