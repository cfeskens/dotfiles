#!/bin/bash

if [ ! -d ~/rc_files ]; then
  git clone https://stash.app.willamette.edu/scm/~cfeskens/rc_files.git
else
  cd ~/rc_files
  git pull origin master
fi

cd ~/rc_files/

for file in `ls -A`; do
  if [ ! -h ~/$file ]; then
    read -p "Change `readlink -m ~/$file` to symlink (y/n)?" choice
    case "$choice" in
      y|Y ) ln -sf ~/rc_files/$file ~/$file;;
      n|N ) echo "Skipping ~/$file";;
      * ) echo "invalid";;
    esac
  fi
done
