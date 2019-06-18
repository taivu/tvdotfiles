## mac osx 
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias bento='cd /Users/taivu/Documents/Sandbox/Vagrant/bento-bionic';
alias cyber='cd /Users/taivu/Documents/Sandbox/Sites';
alias npmlist='npm list -g --depth=0'


alias ls='ls -GFhl'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias gh='history | grep '
#alias python='python3'
#alias pip='pip3'

#alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
function mylast () {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: $1 not a number" >&2
  else
    history | awk '{a[$2]++} END {for (i in a) print a[i], i}' | sort -rn | head -n $1
  fi
}

function remove-merged-branches () {
  # This has to be run from master
  git checkout master

  # Update our list of remotes
  git fetch
  git remote prune origin

  # Remove local fully merged branches
  git branch --merged master | grep -v 'master$' | xargs git branch -d

  # Show remote fully merged branches
  echo "The following remote branches are fully merged into master and will be removed:"
  git branch -r --merged master | sed 's/ *origin\///' | grep -v 'master$'

  read -p "Continue (y/n)? "
  
  if [ "$REPLY" == "y" ] ; then
    # Remove remote fully merged branches
    git branch -r --merged master | sed 's/ *origin\///' | grep -v 'master$' | xargs -I% git push origin :%
    echo "Done!" say "Obsolete branches are removed"
  fi
}

function taigrep () {
  grep -rnIi "$1" . --color
}
