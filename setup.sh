#!/bin/bash

function test_command {
  if command -v $1 >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

function setup_node {
  test_command volta
  if (( $? == 0 )); then
    echo "volta has been installed"
  else
    curl https://get.volta.sh | bash
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
  fi

  test_command node
  if (( $? == 0 )); then
    echo "node has been installed"
  else
    volta install node
    volta install pnpm
  fi
}

function setup_rust {
  test_command cargo
  if (( $? == 0 )); then
    echo "rust has been installed"
    return 0
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
}

function setup_cli {
  test_command btm
  if (( $? == 1 )); then
    cargo install bottom --locked
  fi

  test_command tokei
  if (( $? == 1 )); then
    cargo install tokei
  fi

  test_command exa
  if (( $? == 1 )); then
    cargo install exa
  fi

  test_command fd
  if (( $? == 1 )); then
    cargo install fd-find
  fi
}

# Install cli tools
npm i -g pnpm taze rimraf tsx
