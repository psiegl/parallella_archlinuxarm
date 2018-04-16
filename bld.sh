#!/bin/bash

package() {
  dir=$1
  if [[ $2 ]]
  then
    pkg=$2*.pkg.tar.xz
  else
    pkg=$1*.pkg.tar.xz
  fi

  cd ${dir}
  makepkg -f
  sudo pacman -U ${pkg} --noconfirm
  cd ..
}

# general packages
sudo pacman -S bc i2c-tools
package zynqtemp

# packages for parallella
sudo pacman -S lm_sensors
package lm_sensors-parallella
package uboot-parallella uboot-parallella*hdmi*7020

# packages for epiphany
package epiphany-udev
package epiphany-elf-binutils
package epiphany-elf-gcc
package epiphany-lib
package epiphany-pal
package epiphany-hal
