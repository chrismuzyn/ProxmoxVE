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

msg_info "Updating Container OS"
$STD dnf -y update
msg_ok "Updated Container OS"

msg_info "Installing Dependencies"
$STD dnf install -y sudo
msg_ok "Installed Dependencies"

motd_ssh
customize

msg_info "Cleaning up"
$STD dnf -y autoremove 2>/dev/null || true
$STD dnf -y clean all 2>/dev/null || true
msg_ok "Cleaned"
