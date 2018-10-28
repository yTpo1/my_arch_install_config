Step by step instalation and configuration instruction
sources:
https://www.youtube.com/watch?v=4PBqpX0_UOc
https://wiki.archlinux.org/index.php/Installation_guide

1 Pre-installation

    1.1 Set the keyboard layout
    
    1.2 Verify the boot mode
    
    (this is for bios, not uefi)
    to check what if bios/uefi is installed:
    ls /sys/firmware/efi/efivars
    (if ls: connot access, you have bios)

    1.3 Connect to the Internet
    (Check internet connection)
    ping youtube.com

    (if using wifi, not ethernet)
    wifi-menu
    
    1.4 Update the system clock
    
    timedatectl set-ntp true
    
    1.5 Partition the disks
    
    # see what partitions are present
    lsblk
    # tool for partitioning
    fdisk /dev/sdb
    # see primary partition
    p
    # delete all old partitions
    d
    # create new partiotions
    n
      # choose primary partition
      >default
      # choose 1-4, default 1
      >defualt
      # first sector
      >default (2048)
      # how big partition to be
      # first is boot. We want 200 megabytes
      +200M
      # if asks to remove signature just say Y
    n
      # choose primary partition
      >default 
      # choose 2-4, default 2
      >defualt
      # Swap. For hybernate computer. Has different recomendations. 150% of ram size. 
      # Since im doing it for a virtual machine, I can't offer alot of space
      +2G
    p
    n
      >default
      >default
      # root partition
      +15G
    n
      p
      #home partition
      #use all the rest of the space
      
    # write. Do all the changes
    w
    
    1.6 Format the partitions
    
    # boot
    mkfs.ext4 /dev/sdb1
    # root
    mkfs.ext4 /dev/sdb3
    # home
    mkfs.ext4 /dev/sdb4
    # swap
    mkswap /dev/sdb2
    swapon /dev/sdb2
    
    1.7 Mount the file systems
    
    # root
    mount /dev/sdb3 /mnt
    
    mkdir /mnt/home
    mkdir /mnt/boot
    mount /dev/sdb1 /mnt/boot
    mount /dev/sdb4 /mnt/home

2 Instalation
# install arch linux where i tell it to. And install additional packages
pacstrap /mnt base base-devel vim git
    
3 Configure the system

    3.1 Fstab
    
    genfstab -U /mnt >> /mnt/etc/fstab
    
    3.2 Chroot
    
    # get out of usb into your arch linux
    arch-chroot /mnt
    
    3.3 Seting up a network manager
    # By default no arch doesn't have internet access
    pacman -S networkmanager
    # telling systemd to automatickly start it
    systemctl enable NetworkManager
    
    3.3 Time zone
    ls usr/share/zoneinfo/
    ls /etc/localtime
    # ln - link
    ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
    
    3.4 Localization
    # uncomment. If need multiple lang, uncomment more
    # en_US.UTF-8 UTF-8
    # en_US ISO-8859-1
    vim /etc/locale.gen
    # read uncommented like and generate
    locale-gen
    # write: LANG=en-US.UTF-8
    vim /etc/locale.conf
    
    
    3.5 Network configuration
    vim /etc/hostname
    # choose a hostname
    myarch
    
    3.6 Initramfs
    3.7 Root password
    #set a password for root
    passwd
    
    3.8 Boot loader
    #grub as my bootloader
    pacman -S grub
    grub-install --target=i386-pc /dev/sdb
    grub-mkconfig -o /boot/grub/grub.cfg
    
4 Reboot
exit
umount -R /mnt
reboot






