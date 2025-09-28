#!/bin/bash

### check for zsh & pip existence
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y \
  zsh \
  neovim \
  git-delta \
  powerline

### setup timezone for the machine
TIMEZONE=$(curl -s https://ipinfo.io | grep '"timezone":' | awk '{ print $2 }' | tr -d ',"')
sudo timedatectl set-timezone "$TIMEZONE"

### Vim setup
# vim-plug is a Vim plugin system, allows for quick and easy installation of new vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Modify your vimrc as necessary to remove any plugins or add any plugins
cp -r ./vim/.vimrc ~/
mkdir -p ~/.vim/
cp -r ./vim/.vim/* ~/.vim/
mkdir -p ~/.config/nvim
cp ./vim/neo.vim ~/.config/nvim/init.vim
# Below installs all the vim plugins
nvim +PlugInstall +qall

# Setup GPG forwarding files
mkdir -p ~/.gnupg
cp ./gpg/gpg.conf ~/.gnupg/gpg.conf
grep -qxF 'StreamLocalBindUnlink yes' /etc/ssh/sshd_config || echo 'StreamLocalBindUnlink yes' >> /etc/ssh/sshd_config

mkdir -p ~/.ssh
cp -r ./git/.gitconfig ~/
cat ./bash/.bash_profile >> ~/.bash_profile
cp -r ./tmux/.tmux.conf ~/
TMUX_POWERLINE_LOCATION="/usr/share/powerline/bindings/tmux/powerline.conf"
ESC_POWERLINE_LOCATION=$(echo $TMUX_POWERLINE_LOCATION | sed 's_/_\\/_g')
sed -i -e "s/\$POWERLINE_LOCATION/$ESC_POWERLINE_LOCATION/" ~/.tmux.conf

# Oh My Zsh is a zsh theming library
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zsh/.zshrc ~/.zshrc
curl https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -o ~/.oh-my-zsh/themes/honukai.zsh-theme

echo "You may need to install Powerline fonts (see README) if you see weird squares in tmux or vim."
echo "Setup complete, exit and sign back in for updated zsh environment."
