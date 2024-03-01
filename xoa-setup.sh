#!/bin/bash

echo "[+] Updating packages"
apt update && apt -y upgrade
apt install tmux \
    vim \
    git \
    sudo \
    xe-guest-utilities

echo "[+] Creating self-singed certificate"
mkdir -p /opt/xo
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /opt/xo/xo.crt -keyout /opt/xo/xo.key

echo "[+] Clone XenOrchestraInstallerUpdater.git"
git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git

echo "[+] Setting up xo-install.cfg"
cd XenOrchestraInstallerUpdater
cp sample.xo-install.cfg xo-install.cfg

echo "[+] Listen on port 443 instead of 80"
sed -i 's/PORT="80"/PORT="443"/g' xo-install.cfg

echo "[+] Configure self-signed cert/key to be used"
sed -i 's/^#\(.*PATH\_TO\_HTTPS*\)/\1/' xo-install.cfg

echo "[+] Begin XOA installer"
./xo-install.sh --install
