# this file should be idempotent, but ideally should be run once

sudo sh -c \
' \
apt update
apt dist-upgrade -y

# primary desktop environments
apt install gnome-session ubuntu-session aptitude apt-clone snapd curl -y

# critical soft dependencies, without them, most flatpak app permissions cannot be granted
apt install desktop-base gnome-keyring xdg-desktop-portal \
                                       xdg-desktop-portal-gnome \
                                       xdg-desktop-portal-kde \
                                       xdg-desktop-portal-wlr \
                                       xdg-desktop-portal-xapp \
                                       ubuntu-restricted-extras ubuntu-settings \
                                      -y

# build tools for some rust projects
apt install clang clang-tools libudev-dev opam -y

apt remove modemanager

apt --purge autoremove

snap refresh

snap install snap-store rustup node
'

rustup default stable

