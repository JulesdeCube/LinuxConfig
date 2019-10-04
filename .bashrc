#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cd..='cd ..'

function g {
  git rev-parse --show-toplevel > /dev/null 2>&1
  if [ $? == 0 ]
  then BRANCH="$(git branch 2>/dev/null | sed -n "s/* \(.*\)/\1/p")"
    echo -e "\e[97mon \e[33m$BRANCH"
  fi
}

function p {
  git rev-parse --show-toplevel > /dev/null 2>&1
  if [ $? == 0 ]
    then GIT="$(git rev-parse --show-toplevel)"
    RELATIV="$(git rev-parse --show-prefix)"
      BASE="$(basename $GIT)/$RELATIV"
      echo $BASE | sed s'/.$//'
  else 
    BASE=$(pwd)
    BASE=$(echo $BASE | sed -e "s|^$HOME/Windows||g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Server||g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Project||g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Desktop| |g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Images| |g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Documents| |g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Music|♫|g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Downloads| |g")
    BASE=$(echo $BASE | sed -e "s|^$HOME/Videos| |g")
    BASE=$(echo $BASE | sed -e "s|^$HOME| |g")
    echo $BASE
  fi
}
function c {
  #$COL=$(echo "$*" | sed -e "s| |;|g")
  A=$(echo $* | sed -e 's| |;|g')
  echo -e -n "\e["$A"m"
}

PS1='\[`c 1 34 49`\]\u \[`c 97`\]at \[`c 31`\]\h \[`c 97`\]in \[`c 32`\]`p` `g` \n\[`c 97`\]\$ \[`c 0 39 49`\]'
#PS1='\e[1m\e[31m\u \e[97mat \e[34m\h \e[97min \e[32m`getPath` `gitBranch`\n\[$(c 97)\]\$ \[$(c 39 21])\]'
