# create Raspbian package
PKGNAME="retropie-supplementary-emulationstation"
mkdir $PKGNAME
mkdir $PKGNAME/DEBIAN
cat >> $PKGNAME/DEBIAN/control << _EOF_
Package: $PKGNAME
Priority: optional
Section: devel
Installed-Size: 1
Maintainer: Florian Mueller
Architecture: armhf 
Version: 1.9.1
Depends: libsdl1.2-dev, libboost-system-dev, libboost-filesystem-dev, libfreeimage-dev, libfreetype6-dev, libeigen3-dev, ttf-dejavu
Description: This package contains the front-end EmulationStation.
_EOF_
mkdir -p $PKGNAME/usr/share/RetroPie/supplementary/EmulationStation
cd
cp -r RetroPie/supplementary/EmulationStation/* $PKGNAME/usr/share/RetroPie/supplementary/EmulationStation/

# create package
dpkg-deb -z8 -Zgzip --build $PKGNAME

# sign Raspbian package
dpkg-sig --sign builder $PKGNAME.deb

# add package to repository
cd RetroPieRepo
reprepro --ask-passphrase -Vb . includedeb wheezy /home/pi/$PKGNAME.deb

# create GPG key for signing Raspbian packages
echo "bcm2708-rng" >> /etc/modules
sudo modprobe bcm2708-rng
apt-get install rng-tools
gpg --gen-key
gpg --armor --export contact@petrockblock.com --output contact@petrockblock.com.gpg.key > contact@petrockblock.com.gpg.key


# Create repository
mkdir RetroPieRepo
mkdir RetroPieRepo/conf
cat >> RetroPieRepo/conf/distributions << _EOF_
Origin: apt.petrockblock.com
Label: apt repository
Codename: wheezy/rpi
Architectures: armhf other source
Components: main
Description: RetroPie Raspbian package repository
SignWith: yes
Pull: wheezy/rpi
_EOF_

# install repository helper
sudo apt-get install reprepro


# exemplary call for removing a package
reprepro --ask-passphrase remove wheezy retropie-1.9.1

Download key via:
wget -O - http://apt.petrockblock.com/contact@petrockblock.com.gpg.key | sudo apt-key add -

echo "deb http://apt.petrockblock.com/ wheezy main" >> /etc/apt/sources.list