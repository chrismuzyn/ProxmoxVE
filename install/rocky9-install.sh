#!/usr/bin/env bash
# Copyright (c) 2021-2026 community-scripts ORG
# Author: Chris Muzyn (chrismuzyn)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://rockylinux.org/

source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD dnf install -y sudo
msg_ok "Installed Dependencies"

motd_ssh
customize
cleanup_lxc
