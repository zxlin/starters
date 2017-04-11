#!/bin/bash

# check for zsh existence
command -v zsh >/dev/null 2>&1 || { echo >&2 "$1 aborted, please install zsh first"; exit 1; }
command -v pip >/dev/null 2>&1 || { echo >&2 "$1 aborted, please install python-pip first"; exit 1; }

sudo pip install git+git://github.com/Lokaltog/powerline

cp -r ./vim/.vimrc ~/
mkdir -p ~/.vim/
cp -r ./vim/.vim/* ~/.vim/
cp -r ./git/.gitconfig ~/
cp -r ./tmux/.tmux.conf ~/
cat ./bash/.bash_profile >> ~/.bash_profile
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zsh/.zshrc ~/.zshrc
wget https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -O ~/.oh-my-zsh/themes/honukai.zsh-theme
