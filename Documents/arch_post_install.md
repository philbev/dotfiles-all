Installation Tasks After Install of Arch Linux
==============================================

Networking
==========

Start and Enable
----------------
```bash
    sudo systemctl start NetworkManager
    sudo systemctl enable NetworkManager
```

Then check for connection:
```bash
    ip a
```
or
```bash
    ping archlinux.org
```

Printing
========

Install drivers and start services:

```bash
    sudo pacman -S cups hplip
    sudo systemctl start org.cups.cupsd.service
    sudo systemctl enable org.cups.cupsd.service
```

The printer can then be configured in three ways.
```bash
    1. Cups web interface (localhost:631)
    2. KDE's system settings->printers application.
    3. The hp-setup programme (installed with hplip package)
```

Solid State Disk
================

Enable clean up of SSD:
```bash
    sudo systemctl start fstrim.timer
    sudo systemctl enable fstrim.timer
```
