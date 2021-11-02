# Refer to https://github.com/thoughtbot/dotfiles for a good reference

# ----------p10k instant prompt ----------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- Custom functions ----------
for function in ~/.config/zsh/functions/.*; do
    source $function
done

# ---------- Themes ----------
ZSH_THEME="powerlevel10k/powerlevel10k"

# ---------- Exports ----------
# Language
export LANG=en_US.UTF-8
# Editor
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
# JAVA Home path
export JAVA_HOME=$(/usr/libexec/java_home -v 14)
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
# Path
# export PATH=/user/local/bin:$HOME/bin:/Users/zachyho/Development/clang+llvm-6.0.0-x86_64-apple-darwin/bin:$JAVA_HOME/bin:$PATH
export PATH=$HOME/opt/GNAT/2019/bin:/usr/local/bin:$HOME/bin:$JAVA_HOME/bin:$PATH
# CPath for the fucking header files in Xcode
export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Path to NVIM Home
export NVIM_HOME=$HOME/.config/nvim
# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# ZSH Update Frequency
export UPDATE_ZSH_DAYS=7
# FZF command
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
MPI_DIR=/user/local/openmpi
export LD_LIBRARY_PATH=$MPI_DIR/lib:$LD_LIBRARY_PATH

# ---------- Aliases ----------
# General usage
alias clr='clear'
# nvim
alias v='nvim'
alias vi='nvim'
# Nightly build. Script is under '/usr/local/bin'
alias vn='nvim-nightly.sh'
# lazygit
alias lg='lazygit'
# neofetch
alias neofetch='neofetch --backend kitty --source $HOME/Documents/MyDocuments/Photos/AndyDrawing.jpg'
# Java
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java14='export JAVA_HOME=$JAVA_14_HOME'
# SSH
alias ssh='TERM=xterm-256color ssh'
# Navigating to dotfiles, and regularly-used directories
alias nrc='cd $HOME/.config/nvim && v'
alias krc='cd $HOME/.config/kitty && v'
alias zrc='cd $HOME/.config/zsh && v'
alias orgs='cd $HOME/zachyho-codes/zachyho-orgs && v'
# git (inspired by oh-my-zsh aliases)
alias gacmsg='git add . && git commit -m'
# Canva dprint
alias dp='$HOME/work/canva/tools/dprint/dprint fmt'

# ---------- Plugins ----------
plugins=(
   git colored-man-pages
   zsh-autosuggestions
   zsh-syntax-highlighting
)
# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ---------- General settings ----------
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# ---------- Executables ----------
# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Eval direv
eval "$(direnv hook $SHELL)"

# p10k
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.config/dotfiles/zsh/.p10k.zsh ]] || source ~/.config/dotfiles/zsh/.p10k.zsh

alias luamake=/Users/zacharyho/.language_servers/lua-language-server/3rd/luamake/luamake
