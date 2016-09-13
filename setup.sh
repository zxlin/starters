#!/bin/bash

cp -r ./vim/.vimrc ~/
mkdir -p ~/.vim/
cp -r ./vim/.vim/* ~/.vim/
cp -r ./git/.gitconfig ~/
cp -r ./tmux/.tmux.conf ~/
cat ./bash/.bash_profile >> ~/.bash_profile
cp ./zsh/.zshrc ~/.zshrc
wget https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -O ~/.oh-my-zsh/themes/honukai.zsh-theme
