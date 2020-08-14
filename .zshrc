# Refer to https://github.com/thoughtbot/dotfiles for a good reference

# Load custom executable functions
for function in ~/.config/zsh/functions/.*; do
    source $function
done

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- Exports ----------
# Language
export LANG=en_US.UTF-8
# Editor
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
# JAVA Home path (using Java 8)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# Path
export PATH=$HOME/bin:/usr/local/bin:/Users/zachyho/Development/clang+llvm-6.0.0-x86_64-apple-darwin/bin:$JAVA_HOME/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/zachyho/.oh-my-zsh"
# JAVA
export JAVA_14_HOME=$(/usr/libexec/java_home -v14)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
# Solr
export SOLR_HOME="/usr/local/Cellar/solr/8.5.2/server/solr"
# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ---------- Themes ----------
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ---------- Aliases ----------
# General usage
alias clr='clear'
# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
# neofetch
alias neofetch='neofetch --backend kitty --source $HOME/Documents/MyDocuments/Photos/AndyDrawing.jpg'
# tmux
alias tm='tmux'
# Java
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java14='export JAVA_HOME=$JAVA_14_HOME'
# Solr
alias solr="/usr/local/Cellar/solr/8.5.2/bin/solr"

# ---------- FZF stuff ----------
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# ---------- p10k ----------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---------- Plugins ----------
plugins=(git colored-man-pages)
# oh-my-zsh
source $ZSH/oh-my-zsh.sh
# zsh-autosuggestions (with homebrew)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting (with homebrew)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"
