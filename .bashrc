############################################################
# $Id: .bashrc 48 2011-11-08 23:26:47Z cfeskens $
# $HeadURL: http://repo.willamette.edu/svn/cfeskens/.bashrc $ 
# $Revision: 48 $
# $Author: cfeskens $ 
# $Date: 2011-11-08 15:26:47 -0800 (Tue, 08 Nov 2011) $
############################################################
# .bashrc 
############################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ( type -P vim >/dev/null ); then
  EDITOR=vim
else
  EDITOR=vi
fi
# User specific aliases and functions

# set path on various OSes
case `uname` in
	Linux)
		PATH=$PATH:/usr/sbin:/sbin
		;;
	SunOS)
		PATH=$PATH:/usr/local/bin:/usr/openwin/bin:/opt/sfw/bin:/usr/sfw/bin:/usr/ucb:/usr/ccs/bin:/usr/sbin:/sbin
		;;
	*)
		;;
esac

if [ -f /etc/redhat-release ]; then
  PUPPET_LOG=/var/log/messages
else
  PUPPET_LOG=/var/log/syslog
fi
export PATH EDITOR PUPPET_LOG

############################################################
# bash options
############################################################
shopt -s checkwinsize
shopt -s histappend histreedit histverify
set -o vi
############################################################
# aliases
############################################################
# LDAP
case `uname` in
  Linux)
	alias lds='ldapsearch -x -h ldap -b "o=willamette.edu" -D "cn=Directory Manager" -y /etc/.ldap.cred'
	alias ldmod='ldapmodify -x -h ds -D "cn=Directory Manager" -y /etc/.ldap.cred'
    alias sudo='sudo -E '
	;;
  SunOS)
	alias lds='ldapsearch -B -h ldap -b "o=willamette.edu" -D "cn=Directory Manager"'
	alias ldmod='ldapmodify -h ds -D "cn=Directory Manager"'
	;;
  *)
	;;
esac

alias beep='echo -n '
alias solpkgmk='pkgmk -o -r / -d /tmp -f Prototype'
alias jnbSA='ssh -X cfeskens@tatum "/opt/openv/netbackup/bin/jnbSA &"'
alias rd='rdesktop -g 1280x1024 -a 16'

# Puppet related
alias pv='puppet parser validate '
alias pr='sudo pkill -USR1 puppet; sudo tail -f $PUPPET_LOG'
alias ptest='sudo /usr/sbin/puppetd --test'
alias pdebug='/usr/sbin/puppetd --test --debug'

# git stuff
alias clonedotfiles='git clone https://cfeskens@stash.app.willamette.edu/scm/~cfeskens/dotfiles.git ~/dotfiles'
alias clonepuppet='git clone https://cfeskens@stash.app.willamette.edu/scm/puppet/environments.git'
alias gam='ssh cfeskens@appserver1 python /usr/local/adm/gam/gam.py'
############################################################
# Functions
############################################################
function makerpmdirs () {
  for dir in BUILD RPMS SOURCES SPECS SRPMS; do
	mkdir -p ~/rpm/$dir
  done
  for dir in noarch i386 i586 i686 x86_64; do
	mkdir -p ~/rpm/RPMS/$dir
  done
}
function fixterm () {
  stty sane
  tput rmacs
}
# Here is a comment
