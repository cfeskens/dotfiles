#!/usr/bin/bash
PATH=$PATH:/usr/local/bin:~/bin

# Get updated profile from git 
~/bin/movein.sh

PS1="`/bin/hostname`$ " 

export PATH PS1
source ~/.bashrc
