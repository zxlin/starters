#!/bin/bash

cp -r ./vim/.vimrc ~/
mkdir -p ~/.vim/
cp -r ./vim/.vim/ ~/.vim/
cp -r ./git/.gitconfig ~/
cat ./bash/.bash_profile >> ~/.bash_profile
