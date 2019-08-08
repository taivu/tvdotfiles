if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

export PATH=/usr/local/php5/bin:$PATH
# export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# export PATH="/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python:$PATH"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"




# display directories and files in different colors when running ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced;
#export LSCOLORS=exfxcxdxbxegedabagacad;

if tput setaf 1 &> /dev/null; then
  tput sgr0; # reset colors
  bold=$(tput bold);
  reset=$(tput sgr0);
  # Solarized colors, taken from http://git.io/solarized-colors.
  black=$(tput setaf 0);
  blue=$(tput setaf 33);
  cyan=$(tput setaf 37);
  green=$(tput setaf 64);
  orange=$(tput setaf 166);
  purple=$(tput setaf 125);
  red=$(tput setaf 124);
  violet=$(tput setaf 61);
  white=$(tput setaf 15);
  yellow=$(tput setaf 136);
else
  bold='';
  reset="\e[0m";
  black="\e[1;30m";
  blue="\e[1;34m";
  cyan="\e[1;36m";
  green="\e[1;32m";
  orange="\e[1;33m";
  purple="\e[1;35m";
  red="\e[1;31m";
  violet="\e[1;35m";
  white="\e[1;37m";
  yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${red}";
else
  userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}";
else
  hostStyle="${yellow}";
fi;

# Set the terminal title to the current working directory.
PS1="\[\033]0;\w\007\]";
#PS1+="\[${bold}\]\n"; # newline
PS1+="\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\]@";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\]: ";
PS1+="\[${cyan}\]\w"; # working directory
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
export HISTTIMEFORMAT="%F %T "
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk

alias dotfiles='/usr/bin/git --git-dir=$HOME/.tvdotfiles/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

function iterm2_print_user_vars() {
  iterm2_set_user_var phpVersion "$(php -v | awk '/^PHP/ { print $2 }')"
  iterm2_set_user_var rubyVersion "$(ruby -v | awk '{ print $2 }')"
  iterm2_set_user_var nodeVersion "$(node -v)"
}
