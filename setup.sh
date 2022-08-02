#!/bin/bash

### check for zsh & pip existence
command -v zsh >/dev/null 2>&1 || { echo >&2 "$1 aborted, please install zsh first"; exit 1; }
command -v pip3 >/dev/null 2>&1 || { echo >&2 "$1 aborted, please install python3-pip first"; exit 1; }

### Powerline - fancy status bar
sudo pip3 install powerline-status

### diff-highlight for git
sudo pip3 install diff-highlight

### Vim setup
# Vundle is a Vim bundle/plugin system, allows for quick and easy installation of new vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ./vim/.vim/bundle/Vundle.vim
# Modify your vimrc as necessary to remove any plugins or add any plugins
cp -r ./vim/.vimrc ~/
mkdir -p ~/.vim/
cp -r ./vim/.vim/* ~/.vim/
# Below installs all the vim plugins using Vundle
vim +PluginInstall +qall

mkdir -p ~/.ssh
cp -r ./git/.gitconfig ~/
cat ./bash/.bash_profile >> ~/.bash_profile
cp -r ./tmux/.tmux.conf ~/
ESC_PIP_LOCATION=$(pip3 show powerline-status | grep 'Location:' | awk '{ print $2 }' | sed 's_/_\\/_g')
sed -i -e "s/\$POWERLINE_LOCATION/$ESC_PIP_LOCATION/" ~/.tmux.conf

# Oh My Zsh is a zsh theming library
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zsh/.zshrc ~/.zshrc
curl https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -o ~/.oh-my-zsh/themes/honukai.zsh-theme
