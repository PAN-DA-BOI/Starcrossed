# Starcrossed
a wrist mounted cyberdeck, powered by a raspberry pi 0 


## Setup
Run the commands below to to setup the pi 0

```
git clone https://github.com/PAN-DA-BOI/Starcrossed.git
chmod +x .Starcrossed/setup.sh
.Starcrossed/setup.sh
```

be sure to enable SPI in the config to enable the screen
to enable SPI on the pi using the command below
```
sudo raspi-config
```
* use the arrow keys in the menu and enter to select the following
   * Interfacing Options
   * SPI
   * Select "Yes" to enable SPI
