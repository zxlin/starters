# Starters
Starter files for Linux

This will configure a number of things on a fresh Linux system: vim, git, bash, tmux, and zsh as well as install powerline for vim and zsh.

## Setup

```bash
git clone https://github.com/zxlin/starters.git
```

Make sure you have `zsh` and `pip3` installed first, then inspect the settings to make sure you don't want to change anything.
To install all the files, run 
```bash
./setup.sh
```

This will change your default shell to `zsh` instead of `bash` that ships with most systems. 

## Fonts

For Powerline fonts, you can install them from the [Powerline Fonts](https://github.com/powerline/fonts/tree/master/Meslo%20Slashed) repo.

```bash
git clone https://github.com/powerline/fonts.git
cd fonts/Meslo Slashed
open .
```

Then install using system font installer.

### Additional

You should install `shellcheck` if you want to check shell scripts

Tested on latest Ubuntu and MacOS.
