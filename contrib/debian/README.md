
Debian
====================
This directory contains files used to package cryptorescued/cryptorescue-qt
for Debian-based Linux systems. If you compile cryptorescued/cryptorescue-qt yourself, there are some useful files here.

## cryptorescue: URI support ##


cryptorescue-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install cryptorescue-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your cryptorescue-qt binary to `/usr/bin`
and the `../../share/pixmaps/cryptorescue128.png` to `/usr/share/pixmaps`

cryptorescue-qt.protocol (KDE)

