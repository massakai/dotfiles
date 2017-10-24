#!/bin/bash

# locale
if [ "$USER" == "root" ]; then
  sudo locale-gen ja_JP.UTF-8
  sudo dpkg-reconfigure locales
fi
