#!/bin/bash

SUDO_AUTH_KEYS_DIR="/etc/ssh/sudo_authorized_keys/"
SUDO_DEFAULTS_SETTING="Defaults\tenv_keep += SSH_AUTH_SOCK"

sudo apt install libpam-ssh-agent-auth -y
sudo mkdir -p "$SUDO_AUTH_KEYS_DIR"

# Inject to line two
(sudo grep "$SUDO_AUTH_KEYS_DIR" /etc/pam.d/sudo && echo "Pam module already configured") || sudo sed -i "2 a auth sufficient pam_ssh_agent_auth.so file=$SUDO_AUTH_KEYS_DIR%u\n" /etc/pam.d/sudo

# Add settings to sudoers
LAST_LINE_WITH_DEFAULTS=$(sudo sed -n "/Defaults/ =" /etc/sudoers | tail -n 1)
(sudo grep "$SUDO_DEFAULTS_SETTING" /etc/sudoers && echo "Sudoers file already configured") || echo "12 a $SUDO_DEFAULTS_SETTING" | sudo EDITOR='sed -f- -i' visudo

# Install authorized_keys
SUDO_AUTH_KEYS_FILE="${SUDO_AUTH_KEYS_DIR}${USER}"
if test -f "SUDO_AUTH_KEYS_FILE"; then
  echo "Authorized keys already installed in $SUDO_AUTH_KEYS_FILE"
  exit 0;
fi

sudo cp ~/.ssh/authorized_keys "$SUDO_AUTH_KEYS_FILE"
sudo chmod 644 "$SUDO_AUTH_KEYS_FILE"

echo "Adding current authorized_keys to $SUDO_AUTH_KEYS_FILE:"
cat ~/.ssh/authorized_keys
