#!/bin/bash

# set -euo pipefail

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

sed -i '/^#pt_BR.UTF-8 UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "archlinux" > /etc/hostname

sed -i '/^#Color/s/^#//' /etc/pacman.conf
sed -i 's/^#ParallelDownloads = 5$/ParallelDownloads = 50/' /etc/pacman.conf

sudo pacman --noconfirm -S base base-devel
sudo pacman --noconfirm -S linux linux-firmware
sudo pacman --noconfirm -S grub efibootmgr
sudo pacman --noconfirm -S networkmanager btrfs-progs
sudo pacman --noconfirm -S vim git zsh chezmoi

systemctl enable --now NetworkManager

useradd -mG wheel luiz
passwd root
passwd luiz

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

su luiz

whoami

