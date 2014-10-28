#!/usr/bin/bash
PATH=$PATH:/usr/local/bin:~/bin

# Get updated profile from git 
#~/bin/movein

if [[ -f /etc/redhat-release ]]; then
  TERM=putty-256color
else
  TERM=xterm-256color
fi

PS1="`/bin/hostname`$ " 

export PATH PS1 TERM
source ~/.bashrc
