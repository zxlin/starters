#!/bin/bash

sudo chmod +w /etc/pam.d/sudo

# Inject to line two
(sudo grep "pam_tid.so" /etc/pam.d/sudo && echo "already enabled") || sudo ed /etc/pam.d/sudo << END
2i
auth       sufficient     pam_tid.so
.
w
q
END

sudo chmod -w /etc/pam.d/sudo
