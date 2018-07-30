#!/bin/bash

# Autheur: Nicolas Guilloux
# Website: https://nicolasguilloux.eu/
# Email:   novares.x@gmail.com

# Shadow dependencies: gconf libva-utils libbsd qt5-svg json-cDo

# ----------------------- Dependancies ----------------------- #
echo "Installing dependencies..."
sudo eopkg it binutils gconf libva-utils libbsd qt5-svg json-c


# ----------------------- Installation ----------------------- #
mkdir /var/tmp/shadow_install
cd /var/tmp/shadow_install

echo "Download the deb file"
wget https://macosx.update.blade-group.fr/mpl/linux/beta/artful/shadowbeta.deb

echo "Extract Shadow Beta"
ar p shadowbeta.deb data.tar.xz | tar xJ

echo "Install Shadow Beta"
sudo cp -rl opt /
sudo cp -rl usr /

echo "Remove temporary files"
cd ~/
rm -R /var/tmp/shadow_install

echo "Add the user to the input group"
sudo usermod -a -G input $USER

ldd -v /opt/Shadow\ Beta/resources/app.asar.unpacked/native/linux/ClientSDL | grep "not found"
echo "Installation finished. Please reboot your computer."

exit 0;