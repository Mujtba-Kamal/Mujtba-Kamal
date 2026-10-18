#!/bin/bash
USERNAME="new_sysadmin"
useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:TemporaryPassword2026!" | chpasswd
chage -d 0 $USERNAME
echo "✅ Linux user $USERNAME created and forced password reset."
