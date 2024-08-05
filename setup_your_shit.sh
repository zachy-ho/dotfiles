# TODO set up directory existence checks before stowing
# Stowing dotfiles
stow -v -t ~/.config nvim_stow_wrapped
stow -v -t ~/.config kitty_stow_wrapped
stow -v -t ~/.config karabiner_stow_wrapped
stow -v -t ~/.config zsh_stow_wrapped
stow -v git

# Manual symlinking
ln -s ~/.dotfiles/zsh_stow_wrapped/zsh/.zshrc ~
ln -s ~/.dotfiles/zsh_stow_wrapped/zsh/.zprofile ~
