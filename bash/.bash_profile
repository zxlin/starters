export PS1="\[\033[38;5;33m\]\u\[$(tput sgr0)\]\[\033[38;5;33m\]@\[$(tput sgr0)\]\[\033[38;5;33m\]\h\[$(tput sgr0)\]\[\033[38;5;75m\]:\[$(tput sgr0)\]\[\033[38;5;147m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;75m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

LS_COLORS=$LS_COLORS:'di=37;40:'; export LS_COLORS
