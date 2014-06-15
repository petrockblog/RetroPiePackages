package=retropie-supplementary-emulationstation
version=1.9.1
pkgname=$(package)-$(version)

all: $(pkgname).deb

$(pkgname).deb: $(pkgname)/DEBIAN/control
	dpkg-deb -z8 -Zgzip --build $(pkgname); \
	dpkg-sig --sign builder $(pkgname).deb
	@echo "*** Package $(pkgname) is ready for distribution."

$(pkgname)/DEBIAN/control:
	mkdir -p $(pkgname)/DEBIAN; \
	touch $(pkgname)/DEBIAN/control; \
	echo "Package: $(pkgname)" > $(pkgname)/DEBIAN/control; \
	echo "Priority: optional" >> $(pkgname)/DEBIAN/control; \
	echo "Section: devel" >> $(pkgname)/DEBIAN/control; \
	echo "Installed-Size: 1" >> $(pkgname)/DEBIAN/control; \
	echo "Maintainer: Florian Mueller" >> $(pkgname)/DEBIAN/control; \
	echo "Architecture: armhf " >> $(pkgname)/DEBIAN/control; \
	echo "Version: $(version)" >> $(pkgname)/DEBIAN/control; \
	echo "Depends: libsdl1.2-dev, libboost-system-dev, libboost-filesystem-dev, libfreeimage-dev, libfreetype6-dev, libeigen3-dev, ttf-dejavu" >> $(pkgname)/DEBIAN/control; \
	echo "Description: This package contains the front-end EmulationStation." >> $(pkgname)/DEBIAN/control; \
	mkdir -p $(pkgname)/usr/share/RetroPie/supplementary/EmulationStation; \
	cp -r /home/pi/RetroPie/supplementary/EmulationStation/* $(pkgname)/usr/share/RetroPie/supplementary/EmulationStation/

clean:
	rm $(pkgname)/DEBIAN/control; \
	rm -rf $(pkgname)/usr/share/RetroPie/supplementary/EmulationStation/; \
	rm $(pkgname).deb

.PHONY: all clean
