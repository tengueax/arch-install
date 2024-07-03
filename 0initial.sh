#!/bin/sh

HOSTNAME="awchlinux"

# Essential packages
pacstrap -K /mnt base base-devel linux linux-headers linux-firmware amd-ucode networkmanager grub vim fastfetch openssh git wget

genfstab -pU >> /mnt/etc/fstab


arch-chroot /mnt

# Timezone & time
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

# Locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Hostname
echo "$HOSTNAME" > /etc/hostname

echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts

# Grub (LEGACY BIOS)
# grub-install --target=i386-pc /dev/sdb

# Windows 10 dualboot
echo 'menuentry "Windows 10" {' >> /etc/grub.d/40_custom
echo '    set root="(hd1,msdos1)"' >> /etc/grub.d/40_custom
echo '    chainloader +1' >> /etc/grub.d/40_custom
echo '}' >> /etc/grub.d/40_custom

grub-mkconfig -o /boot/grub/grub.cfg

# Root user password
passwd

exit umount -R /mnt

echo "Initial installation completed succesfully, you may reboot now"
