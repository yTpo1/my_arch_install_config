source:
https://www.youtube.com/watch?v=nSHOb8YU9Gw&t=1181s

## 1 Users  
1.1 Adding a new user  
**-g wheel** add to group wheel  
**-m** create home directory  
> $ useradd -m -g wheel ghost1  
> $ passwd ghost1  

1.2
give a user sudo access
> $ sudo vim /etc/sudoers  

unccoment:  
wheel ALL=(ALL) ALL  

## 2 GUI
2.1 WM
> $ pacman -S xorg-server xorg-xinit

maybe i3-gaps
maybe extra: network manager (nm-applet)

> $ pacman -S i3-gaps i3status rxvt-unicode dmenu

make the X server start i3 when it starts:
in ~/.xinitrc, put:
        exec i3

2.2 Fonts
> $ pacman -S ttf-linux-libertine ttf-inconsolata 
> $ pacman -S noto-fonts

for FullWidth type of fonts (CJK, latin can't be like that) install
Sans fonts
> $ pacman -S adobe-source-han-sans-otc-fonts
or 
> $ noto-fonts-cjk

to configure
#in ~/.config/fontconfig/fonts.conf

to start WM
> $ startx

-----
System time - The Network Time Protocol (NTP)
enabling ntpd.service via systemd.
> $ pacman -Syu ntp # Installed the required package
> $ systemctl enable ntpd.service # Enable it at boot so every time you boot the system the clock will be synchronized
> $ systemctl start ntpd.service # Start it immediately

3.1 configure i3
Adding wallpaper to i3
install feh
> $ sudo pacman -S feh
./config/i3/config

Set wallpaper
exec_always feh --bg-scale /home/ghost1/Pictures/cyb_bg.jpg

move i3status bar to top
bar {
        position top
        status_command i3status
}

3.2 configure bash
copy the .bashrc file

3.3 configure terminal URxvt
copy .Xdefaults

3.4 configure vim
copy .vimrc

3.5 Autostart Xserver
copy .bash_profile
