#!/usr/bin/bash
PATH=$PATH:/usr/local/bin:~/bin

# Get updated profile from svn
svn export --force http://repo.willamette.edu/svn/cfeskens/ .

PS1="`/bin/hostname`$ " 

export PATH PS1
source ~/.bashrc
