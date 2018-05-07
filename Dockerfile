###
# Sean's Working Environment
##

##
# Usage Instructions:
#   To build the core development environment:
#       docker build -t farewellsolenya/env .
#   To build the development environment, office tools and games:
#       docker build --build-arg scope=full -t farewellsolenya/env .
#
#
##

#
# Based on Debian 
#

FROM debian:buster

#
# Update Sources
# 
RUN apt-get update 
RUN apt-get upgrade -y && apt-get dist-upgrade -y

#
# Set Locale
#   I want to use unicode characters in my ZSH prompt and in DF
#
RUN apt-get install -y locales locales-all
ENV LC_ALL en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB.UTF-8

#
# Install Development Tools
#

RUN apt-get install -y neovim tmux git curl astyle ruby-beautify apache2-utils ranger gnupg links tig zsh ansible rtv jq sshpass
RUN chsh -s $(which zsh)
ENV SHELL /usr/bin/zsh
RUN sh -x -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && apt-get install -y nodejs
RUN npm install -g js-beautify prettier prettydiff nodemon hexo-cli




#
# Install Office Tools
#

ARG scope=core

RUN bash -c 'if [[ $scope == "full" ]]; then apt-get install -y calcurse mutt irssi rtv; fi'
#
# Install Games
#optionally also install df
#
RUN bash -c 'if [[ $scope == "full" ]]; then apt-get install -y nethack-console tintin++; fi'


# Configure Install tools

WORKDIR /root

RUN mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start && git clone https://github.com/w0rp/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale && git clone https://github.com/sbdchd/neoformat.git ~/.local/share/nvim/site/pack/git-plugins/start/neoformat

#set dotfiles
COPY dotfiles /root/dotfiles
RUN ./dotfiles/link.sh
RUN echo ZSH_THEME="sean" >> ~/.zshrc
#set custom prompt
RUN sed -i "s/ZSH_THEME=.*/ZSH_THEME=\"sean\"/g" ~/.zshrc
RUN git config --global user.email "sean@example.com"
RUN git config --global user.name "Sean"

#clone common repos

CMD tmux
