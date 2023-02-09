# Uncomment the line below and the last line in this file for performance profiling
# zmodload zsh/zprof

# --------- p10k instant prompt ----------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- Plugins ----------
if [[ $(uname -m) == 'arm64' ]]; then
    # ZSH Syntax Highlighting
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # ZSH Autosuggestion
    # source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ## ZSH Autocomplete
    source $HOME/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
else
    # ZSH Syntax Highlighting
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # ZSH Autosuggestion
    # source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ## ZSH Autocomplete
    source $HOME/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

# ---------- My custom functions ----------
for function in ~/.config/zsh/functions/.*; do
    source $function
done

# ---------- Theme ----------
if [[ $(uname -m) == 'arm64' ]]; then
    source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
else
    source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
fi

# ---------- Var Exports ----------
# Language
export LANG=en_US.UTF-8
# Editor
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi
# JAVA Home path
# export JDTLS_HOME=$HOME/.language_servers/jdt-language-server-latest/
# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
# export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
# Nix path
export NIX_HOME=$HOME/.nix-profile
# Path
# export PATH=/user/local/bin:$HOME/bin:/Users/zachyho/Development/clang+llvm-6.0.0-x86_64-apple-darwin/bin:$JAVA_HOME/bin:$PATH
export PATH=$HOME/opt/GNAT/2019/bin:/usr/local/bin:$HOME/bin:$JAVA_HOME/bin:$NIX_HOME/bin:$PATH
# CPath for the fucking header files in Xcode
export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
# Path to NVIM Home
export NVIM_HOME=$HOME/.config/dotfiles/nvim
# Path to vimwiki Home
export VIMWIKI=$HOME/zachyho-codes/vimwiki
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
[ -f $HOME/.config/zsh/.aliasesrc ] && source $HOME/.config/zsh/.aliasesrc

# ---------- General settings ----------
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# ---------- Executables ----------
# Automatically run `fnm use` when in a directory containing .node-version or .nvmrc file
eval "$(fnm env --use-on-cd)"

eval "$(direnv hook $SHELL)"

# p10k
# To customize prompt, run `p10k configure` or edit ~/.config/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.config/dotfiles/zsh/.p10k.zsh ]] || source ~/.config/dotfiles/zsh/.p10k.zsh

alias luamake=/Users/zacharyho/.language_servers/lua-language-server/3rd/luamake/luamake

# ---------- Work things ----------
[ -f $HOME/.config/zsh/.canvathingsrc ] && source $HOME/.config/zsh/.canvathingsrc

# ---------- Graveyard start ----------
# NVM (Not used anymore. Now using fnm for node version management)
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# ---------- Graveyard end ----------

# Uncomment the line below and the first line in this file for performance profiling
# zprof
