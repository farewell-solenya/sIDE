cd ~
ln -sf ./dotfiles/.lynxrc .
ln -sf ./dotfiles/.tmux.conf .
ln -sf ./dotfiles/.eslintrc.json .
ln -sf ./dotfiles/.muttrc .
mkdir -p ~/.config/nvim
cd ~/.config/nvim 
ln -sf ../../dotfiles/init.vim .
mkdir -p ~/.config/ranger
cd ~/.config/ranger 
ln -sf ../../dotfiles/rc.conf .
cd ~/.oh-my-zsh/themes
ln -sf ../../dotfiles/sean.zsh-theme .
