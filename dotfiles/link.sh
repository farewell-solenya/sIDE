cd ~
ln -sf ./sIDE/dotfiles/.lynxrc .
ln -sf ./sIDE/dotfiles/.xinitrc .
ln -sf ./sIDE/dotfiles/.tmux.conf .
ln -sf ./sIDE/dotfiles/.eslintrc.json .
ln -sf ./sIDE/dotfiles/.muttrc .
mkdir -p ~/.config/nvim
cd ~/.config/nvim 
ln -sf ../../sIDE/dotfiles/init.vim .
mkdir -p ~/.config/ranger
cd ~/.config/ranger 
ln -sf ../../sIDE/dotfiles/rc.conf .
mkdir -p ~/.config/i3
cd ~/.config/i3
ln -sf ../../sIDE/dotfiles/i3.conf ./config
cd ~/.oh-my-zsh/themes
ln -sf ../../sIDE/dotfiles/sean.zsh-theme .
