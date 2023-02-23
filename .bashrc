# -*-sh-*-
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PATH=/home/user1/bin/:$PATH

# bisal baje jinis
# powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh

# faltu alias
alias v='vim'
alias e='emacs -nw'
alias vi='emacs -nw'
alias cls='tput reset'
alias l='ls'
alias aaa='./run'
alias err='./err'
alias sss='mariadb -u user1 -p'
alias please='sudo'
alias baal='exit'
alias goto='go'

alias ggg='git log --all --graph --decorate'



p()
{
	if [ -z "$1" ]
	then
		(evince) & exit
	else
		(evince $1) & exit
		exit
	fi
}
watch()
{
	if [ -z "$1" ]
	then
		(vlc) & exit
	else
		(vlc $1) & exit
		exit
	fi
}

ccc()
{
	curl https://corona-stats.online/$1?source=2
}

mrr()
{
	sudo vim /etc/pacman.d/mirrorlist
}

st_()
{
	cd /home/user1/Documents/st/st-luke/
	vim config.h
	./a
}

vvv()
{
	vim ~/.vimrc
}
bbb()
{
	vim ~/.bashrc
}
iii()
{
	vim ~/.config/i3/config
}
ala()
{
	vim ~/.config/alacritty/alacritty.yml
}
yyy()
{
	vim ~/.config/youtube-dl/config
}

ba()
{
	upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state
	upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage
}

koto_boro()
{
	if [ -z "$1" ]
	then
		for f in $(ls -a | grep .); do
			if [ "$f" == "." ]; then
				continue;
			elif [ "$f" == ".." ]; then
				continue;
			fi
			sudo du -h --max-depth=0 $f
			# echo $f aaa
		done
	else
		sudo du -h --max-depth=0 $1
	fi
}

al_new()
{
	SHELL_CWD=$(pwd -P)
	alacritty --working-directory $SHELL_CWD
}

brt()
{
	if [ -z "$1" ]
	then
		echo 500 | sudo tee /sys/class/backlight/intel_backlight/brightness
	else
		sudo vim /sys/class/backlight/intel_backlight/brightness
	fi
}

sig()
{
	cat /home/user1/bin/sig.txt
}

wall()
{
    if [ -z "%1" ]
    then
	echo -e "\n\n ki hobe ??\n\n";
    else	
	sudo cp ./$1 /usr/share/backgrounds/a.png;
	feh --bg-scale $1
    fi
}

libre()
{
	(libreoffice $1) & exit
}

go() # go marker
{
    case $1 in
	"compiler")
		cd /home/user1/Documents/__jadavpur/sem6/compiler/lockdown/present/
	;;
	"css")
		cd /home/user1/Documents/book/css/
	;;
	"cp")
		cd /home/user1/Documents/__jadavpur/cp/nation/
	;;
	"down")
		cd /home/user1/Downloads/
	;;
	"faltu")
		cd /home/user1/Documents/__jadavpur/faltu/
	;;
	"curses")
		cd /home/user1/Documents/__jadavpur/faltu/curses/
	;;
	"book")
		cd /home/user1/Documents/book/
	;;
	"graph")
		cd /home/user1/Documents/book/graph/
	;;
	"clrs")
		cd /home/user1/Documents/book/clrs/
	;;
	"ctf")
		cd /home/user1/Documents/__jadavpur/ctf/
	;;
	"network")
		cd /home/user1/Documents/__jadavpur/sem6/network/
	;;
	"history")
		cd /home/user1/Documents/__jadavpur/faltu/history/
	;;
	"material")
		cd /home/user1/Documents/book/material/
	;;
	"engine")
		cd /home/user1/Documents/__jadavpur/faltu/curses/engine/
	;;
	"emudev")
		cd /home/user1/Documents/__jadavpur/faltu/emudev/
	;;
	"prolog")
		cd /home/user1/Documents/__jadavpur/sem6/ppl/prolog/
	;;
	"sem")
		cd /home/user1/Documents/__jadavpur/sem7/
	;;
	"chip")
		cd /home/user1/Documents/__jadavpur/faltu/emudev/chip8/emu/
	;;
	"infocom")
		cd /home/user1/Documents/__jadavpur/infocom/
	;;
	"dwarf")
		cd /home/user1/Documents/__jadavpur/infocom/dwarf_fortress_LNP/df_linux/data/save/
	;;
	"cdda")
		cd /home/user1/Documents/__jadavpur/infocom/cataclysm/Cataclysm-DDA/
	;;
	"snes")
		cd /home/user1/Documents/__jadavpur/infocom/snes/
	;;
	"dbms")
		cd /home/user1/Documents/__jadavpur/sem6/dbms/sql_68/
	;;
	"it") # internet technology
		cd /home/user1/Documents/__jadavpur/sem7/internet/
	;;
	"se") # software engineering
		cd /home/user1/Documents/__jadavpur/sem7/se/
	;;
	"tom")
		cd /home/user1/Documents/__jadavpur/sem7/internet/tom_test/
	;;
	"nes")
		cd /home/user1/Documents/__jadavpur/faltu/emudev/nes/
	;;
	"advent")
		cd /home/user1/Documents/__jadavpur/faltu/algo/advent/
	;;
	"general")
		cd /home/user1/Documents/__jadavpur/general/
	;;
	"p") # project
		cd /home/user1/Documents/__jadavpur/sem7/project/
	;;
	"ai") # artificial intelligence
		cd /home/user1/Documents/__jadavpur/sem7/ai/test/
	;;
	"daa") # artificial intelligence
		cd /home/user1/Documents/__jadavpur/sem7/daa/
	;;
	"d") # downloads
		cd /home/user1/Downloads/
	;;
	"t") # theory
		cd /home/user1/Documents/__jadavpur/theory/
	;;
	"i") # information and coding theory
		cd /home/user1/Documents/__jadavpur/sem7/information/
	;;
	"g") # neuro evolution of augmenting topologies
		cd /home/user1/Documents/__jadavpur/faltu/genetic/
	;;
    esac
    
}
send()
{
    if [ -z "$1" ]; then
	echo "ki korbo ?"
	return;
    fi
    if [ -z "$2" ]; then
	mv $1 /home/user1/Documents/__jadavpur/faltu/genetic/
    fi
}

autoclean1()
{
	# clear unused packages from cache 
	sudo pacman -Scc
	# sudo pacman -Scc to remove installed packages from cache

	# remove orphan packages
	sudo pacman -Rns $(pacman -Qtdq)

	# clear cache in home directory
	rm -rf ~/.cache/*
}

vb()
{
	nohup vistualbox &
	rm nohup.out
	exit
}

color_demo()
{
	for i in {0..255} ; do
		printf "\x1b[38;5;${i}mcolour${i} "
	done
	printf "\n"
}


int()
{
    if [ -z "$1" ]
    then
	nmcli device wifi list;
    else
	nmcli device wifi connect $1;
    fi	
}


# for ranger:
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR
set -o vi


# protonvpn
alias ppc='sudo protonvpn c -f'
alias ppd='sudo protonvpn d'


declare -a curr_book
curr_book[0]="/home/user1/Documents/book/graph_theory.pdf"
curr_book[1]="/home/user1/Documents/book/golpo/lenins_tomb.pdf"
curr_book[2]="/home/user1/Documents/graphics/OpenGL_SuperBible_4th_Edition.pdf"
book()
{
	nohup evince ${curr_book[$1]} &
	rm nohup.out
	exit
}




ttt()
{
	/home/user1/script/exe_timer $1 $2
}


local_disk()
{
	if [ -z "$1" ]
	then
		echo -e "\n\n  kon local disk ?\n\n"
	elif [ "$1" == "e" ]
	then
		sudo umount /dev/sda6 > /dev/null 2>&1
		sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
		cd /mnt/local_disk_e/
		echo -e "\n\n  thik ache\n\n"
	elif [ "$1" == "d" ]
	then
		sudo umount /dev/sda5 > /dev/null 2>&1
		sudo mount /dev/sda5 /mnt/local_disk_d > /dev/null 2>&1
		cd /mnt/local_disk_d/
		echo -e "\n\n  thik ache\n\n"
	else
		echo -e "\n\n  hobe na\n\n"
	fi

}
faltu2()
{
   cd /run/user/1000/gvfs/
}

duto()
{
    alacritty & disown
	clear
}


bakdot()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/dot/

	yes | cp -f /home/user1/.bashrc /mnt/local_disk_e/dot/
	yes | cp -f /home/user1/.vimrc /mnt/local_disk_e/dot/
	yes | cp -rf /home/user1/script/ /mnt/local_disk_e/dot/

	echo -e "\n\n"
}


#roguelikes --------------------------------------------------------------------
dwarf()
{
	sudo umount /dev/sda5 > /dev/null 2>&1
	sudo mount /dev/sda5 /mnt/local_disk_d > /dev/null 2>&1
	cd /mnt/local_disk_d/monty_python/dastactic_df/

	tput reset

	if [ -z "$1" ]
	then
		echo -e "\n\n   strike the earth\n\n"
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
dcss()
{
    cd /home/user1/Documents/__jadavpur/infocom/crawl/crawl-ref/source/
    (/home/user1/Documents/__jadavpur/infocom/crawl/crawl-ref/source/crawl) & exit
}
cavestory()
{
    cd /home/user1/Documents/__jadavpur/infocom/cavestory-1.01/
    (./doukutsu) & exit
}
cdda()
{
    cd /home/user1/Documents/__jadavpur/infocom/cataclysm/Cataclysm-DDA/
    (./cataclysm-tiles) & exit
}
tome()
{
    cd /home/user1/Documents/__jadavpur/infocom/tales_of_maj_eyal/
    (./t-engine) & exit
}
#emulator--------------------------------------------------------------------------
snes()
{
    (snes9x-gtk $1) & echo -e "\n\n thik ache\n\n"
    cd /home/user1/Documents/__jadavpur/infocom/snes/
    ls
    exit
}
#----------------------------------------------------------------------------------

movie()
{
	sudo umount /dev/sda5 > /dev/null 2>&1
	sudo mount /dev/sda5 /mnt/local_disk_d > /dev/null 2>&1
	cd /mnt/local_disk_d/monty_python/

	tput reset

	if [ -z "$1" ]
	then
		echo -e "\n\n   get busy living or get busy dying\n\n"
		ls
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}


#videos------------------------------------------------------------------------

algo()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/mitocw_algorithms/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
net()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/northeastern_network/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	elif [ $1 == "idx" ]
	then
		vim idx
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
prob()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/nptel_prob/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
khan_linear()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/khan_linear/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
tbob_linear()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/3b1b_linear/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}
arch()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	cd /mnt/local_disk_e/gamedownload/thik_ache/cmu_arch/

	tput reset

	if [ -z "$1" ]
	then
		cat list
	else
		a=$1.mp4
		(vlc $a &) && exit
	fi
}



backup()
{
	sudo umount /dev/sda6 > /dev/null 2>&1
	sudo mount /dev/sda6 /mnt/local_disk_e > /dev/null 2>&1
	rsync -aP ~/Documents/__jadavpur/sem6/ /mnt/local_disk_e/__jadavpur/
}




#------------------------------------------------------------------------videos



# functions
ala_font()
{
	mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/tmp2
	mv ~/.config/alacritty/tmp ~/.config/alacritty/alacritty.yml
	mv ~/.config/alacritty/tmp2 ~/.config/alacritty/tmp
}
retro()
{
	(retroarch) & exit
}
blow()
{
	cd ~/Documents/__jadavpur/faltu/curses/engine/
	./a.out
}

tom()
{
	if [ -z "$1" ]
	then
	    echo "restarting tomcat"
	    systemctl restart tomcat8
	elif [ "$1" = "start" ]
	then
	    echo "starting tomcat"
	    systemctl start tomcat8
	else
	    echo "stoping tomcat"
	    systemctl stop tomcat8
	fi
    
}
export CLASSPATH=$CLASSPATH:/opt/tomcat/common/lib/servlet-api.jar



