# Path adjustments
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.nimble/bin:$HOME/.nvm/versions/node/v20.9.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/bin:/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# Java and Python
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PICO_SDK_PATH="$HOME/source/pico-sdk"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# -----------------------
# Oh My Zsh
# -----------------------
ZSH_THEME="passion"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
    git
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# -----------------------
# Zinit (Plugin Manager)
# -----------------------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} Installing Zinit..."
    mkdir -p "$HOME/.local/share/zinit" && chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33}Installation successful.%f" || \
        print -P "%F{160}Installation failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zdharma-continuum/fast-syntax-highlighting

alias zshconfig="nano ~/.zshrc"
alias update="sudo pacman -Syu --noconfirm" # informant will stop me if something important changes
alias reload="source ~/.zshrc && echo 'zsh config reloaded'"
alias myip4="curl ifconfig.me -4"
alias myip6="curl ifconfig.me -6"
alias pingcf="ping 1.1.1.1"
alias fs="du -h --max-depth=1"
