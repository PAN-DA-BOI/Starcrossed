#!/bin/bash

# Update and upgrade
apt-get update -y
apt-get upgrade -y


apt-get install -y unzip cmake xserver-xorg-input-evdev xinput-calibrator nheko

wget https://files.waveshare.com/wiki/common/Waveshare35c.zip
unzip ./Waveshare35c.zip
cp waveshare35c.dtbo /boot/overlays/

cat <<EOL | sudo tee -a /boot/firmware/config.txt > /dev/null
dtparam=spi=on
dtoverlay=waveshare35c
hdmi_force_hotplug=1
max_usb_current=1
hdmi_group=2
hdmi_mode=1
hdmi_mode=87
hdmi_cvt 480 320 60 6 0 0 0
hdmi_drive=2
display_rotate=0
EOL


echo "export FRAMEBUFFER=/dev/fb1" >> ~/.bash_profile

cat <<EOL | sudo tee /usr/share/X11/xorg.conf.d/99-fbturbo.conf > /dev/null
Section "Device"
        Identifier      "Allwinner A10/A13 FBDEV"
        Driver          "fbturbo"
        Option          "fbdev" "/dev/fb0"
        Option          "SwapbuffersWait" "true"
EndSection
EOL


cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

#setup GPIO for encoder


#install all necessary packages


#matrix install
sudo apt install nheko


echo "The system will now reboot."
reboot now
