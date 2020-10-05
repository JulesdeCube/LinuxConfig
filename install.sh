#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"
dot_home="profile bashrc bash_logout vimrc vim gitconfig"
source_home="bashrc"

pakages="vim git wget tree make screen zip unzip gcc gdb tree"
server_pakages="nginx php7.3-fpm default-jdk"

echo -e "\e[0;32;7mUPDATE : Dot file"
for f in $dot_home; do
  rm -rf "$HOME/.$f"
  ln -s "$DIR/$f" "$HOME/.$f"
  echo -e "\e[0;1m$f\e[90m"
done

echo -e "\n\n\e[0;33;7mSOURCE : Dot file"
for f in $source_home; do
  source "$HOME/.$f"
  echo -e "\e[0;1m$f\e[90m"
done

echo -ne "\n\n\e[0;34;7mINSTALL : User pakages"
for p in $pakages; do
  echo -e "\n\e[0;1m$p\e[90m"
  sudo apt install "$p"
done

if [[ "$@" == *"--server"* ]]; then
  echo -ne "\n\n\e[0;34;7mINSTALL : Server pakages"
  for p in $server_pakages; do
    echo -e "\n\e[0;1m$p\e[90m"
    sudo apt install "$p"
  done
fi
:
sudo apt autoremove
