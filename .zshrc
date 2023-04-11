source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR=code

# JavaScript Tool Manager https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

#### clash proxy
function proxy {
  if [ -z "$1" ] || [ "$1" = "on" ] ; then
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
  elif [ "$1" = "off" ] ; then
    export https_proxy=
    export http_proxy=
    export all_proxy=
  elif [ "$1" = "list" ] || [ "$1" = "test" ] ; then
    echo "HTTP_PROXY  = $http_proxy"
    echo "HTTPS_PROXY = $https_proxy"
  fi
}
proxy
#### proxy

#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# https://github.com/sharkdp/bat
alias cat='bat'

# https://github.com/ogham/exa
alias ls='exa --git --icons --classify --group --color-scale --group-directories-first'
alias ll='exa --header --long --git --icons --classify --group --color-scale --group-directories-first'

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=white
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=white

# Jabba
# [ -s "/Users/xlor/.jabba/jabba.sh" ] && source "/Users/xlor/.jabba/jabba.sh"
# jabba use zulu@1.8.282

# https://github.com/starship/starship
eval "$(starship init zsh)"
