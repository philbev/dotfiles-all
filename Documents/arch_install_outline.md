# Installation of Arch Linux with Plasma and/or Gnome

## Pre-installation

Download the iso from <https://www.archlinux.org/download/>

Verify the signature:

```bash
    gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

Alternatively, from an existing Arch Linux installation run:

```bash
    pacman-key -v archlinux-version-x86_64.iso.sig
```

### Write to USB

Insert USB drive and discover the device with:

```bash
    lsblk
```

Write to USB drive

```bash
    dd if=archlinux<version>x86_64.iso of=/dev/sdX bs=4M status=progress && sync
```

Where /dev/sdX was obtained from the 'lsblk' command above.

## Boot the Live Environment
Insert the USB stick and boot until archroot prompt is displayed.

## Keyboard Layout
For non US keyboards the configuration needs changing:

```bash
    loadkeys uk
```

Works for UK PC keyboards.

To obtain a list of all keyboard layouts:

```bash
    ls /usr/share/kbd/keymaps/**/*.map.gz
```

If the font is not suitable then 'setfont' can be used:

```bash
    setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu.gz
```

## Internet
Check for connection with:

```bash
    ip a
```

For wifi:

```bash
    wifi-menu
```

## Time

```bash
    timedatectl set-ntp true
```

Check the service status:

```bash
    timedatectl status
```


## Disks

Check partitions with:

```bash
    lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel
```

or

```bash
    lsblk -o +fstype,label
```

Create partitions with 'fdisk', 'gdisk', 'cfdisk' or 'cgdisk'.

### Format partitions

EFI partition

NOTE!!! Not to be performed if efi partition exists. All data will be lost.

```bash
    mkfs.fat -F32 /dev/sdX
```

Root partition:

```bash
    mkfs.ext4 /dev/sdY
```

Home and /usr/local partitions:

Only format these partitions as ext4 if they are being newly created. Do not
format if using existing partitions

### Mount partitions

Root partition:

```bash
    mount /dev/sdX /mnt
```

Home partition:

```bash
    mkdir /mnt/home
```

```bash
    mount /dev/sdX /mnt/home
```

/usr/local partition:

```bash
    mkdir -p /mnt/usr/local

```

```bash
    mount /dev/sdX /mnt/usr/local
```

EFI partition:

```bash
    mkdir -p /mnt/boot/efi

```

```bash
    mount /dev/sdX /mnt/boot/efi
```

## Install Base System

Edit the /etc/pacman.d/mirrorlist file with vim and move United Kingdom servers
to the top.

Install basic software with:

```bash
    pacstrap /mnt base linux linux-firmware gvim neovim
```

## Fstab

Generate the /etc/fstab file:

```bash
    genfstab -U /mnt >> /mnt/etc/fstab
```

Check for correctness:

```bash
    cat /mnt/etc/fstab
```

## Arch-root

Log into the newly created system with:

```bash
    arch-chroot /mnt
```

## Swap
Create swap file:

```bash
    fallocate -l 2GB /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
```

Edit /etc/fstab and append with:

```bash
    /swapfile none swap 0 0
```

## Time

Set timezone:

```bash
    ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
```

Synchronise system and harware clocks:

```bash
    hwclock --systohc --localtime
```

## Locales

Edit /etc/locale.gen

```bash
    vi /etc/locale.gen
```

Search for en_GB and uncomment the lines that contain it.

Generate locale:

```bash
    locale-gen
```

Edit /etc/locale.conf

```bash
    vi /etc/locale.conf
```

Insert line

```bash
    LANG=en_GB.UTF-8
```

## Internet

### Hostname

Edit /etc/hostname

```bash
    vi /etc/hostname
```

Insert \<hostname> of your choice.


### Hosts

Edit /etc/hosts

```bash
    vi /etc/hosts
```

Enter the following lines into the file:

```
    127.0.0.1	localhost
    ::1		localhost
    127.0.1.1	<hostname>.localdomain	<hostname>
```

## Root password

Create root password

```bash
    passwd
```

## Grub

### Packages
Install the following packages:

```bash
    pacman -S grub efibootmgr networkmanager network-manager-applet \
    wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base devel \
    linux-headers
```

Note! wireless_tools and wpa_supplicant are only needed for machines with wi-fi.

### Grub install

```bash
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=<boot-loader name>
```

### Grub Configuration

```bash
    grub-mkconfig -o /boot/grub/grub.cfg
```

## Exit Installation and unmount

Re
```bashturn to Arch boot disk
    exit
```

Unmount new partitions

```bash
    umount -R /mnt
```

or

```bash
    umount -a
```

Will get error messages with second method.

Reboot

```bash
    reboot
```

## New Installation

When rebooted into the new install

## Internet

### Start Networkmanager

Wired connection

```bash
    systemctl start NetworkManager

```

```bash
    systemctl enable NetworkManager
```

NOTE! Uppercase 'N' and 'M' in NetworkManager.

Wireless connection

```bash
    nmtui
```

### Check Internet Connection

```bash
    ip a
```

## Create User Accounts

Create New User

```bash
    useradd -m -g users -G wheel <username>
    passwd <username>
```

## Sudo
Sudo has now to be configured.

```bash
    visudo
```

Edit accordingly.

## Graphics

```bash
    pacman -S nvidia nvidia-utils

```

```bash
    pacman -S xorg
```

## Desktop Environments


### Plasma

```bash
    pacman -S sddm
```

```bash
    systemctl enable sddm
```

Install Plasma and applications

```bash
    pacman -S plasma kde-applications xdg-user-dirs packagekit-qt5
```

### Gnome

Install and enable desktop manager gdm

```bash
    pacman -S gdm

```

```bash
    systemctl enable gdm
```

Install gnome desktop environment

```bash
    pacman -S gnome gnome-extra
```




NOTE! For gnome desktop install 'gnome' and 'gnome-extra' packages.
