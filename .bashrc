KEYBOARD_KEY_TIMEOUT_US=25000
export CVSROOT=:pserver:za@cvs.evision.ru:2401/cvs
export CVSIGNORE=tags

#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export PATH=$HOME/bin:$HOME/usr/bin:$JAVA_HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/za/sqllib/bin

export CLASSPATH=/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/v4theme.jar:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/commons-httpclient-3.1.jar:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/mail.jar:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/log4j-1.2.7.jar:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/xalan.jar:/home/za/etc/lib/servlet-api.jar:/home/za/cvs/evision/src/java:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/gson-2.2.4.jar:/home/za/cvs/evision/src/java:/home/za/cvs/evision/src/www/b2b/WEB-INF:/home/za/sqllib/java/javax.servlet.jar:$CLASSPATH
export CLASSPATH=/home/za/usr/etc/gson-2.8.2.jar:/home/za/cvs/evision/src/www/b2b/WEB-INF/lib/value4fw.jar:$CLASSPATH

export TERM=xterm-256color
export PAGER="batcat"
export INPUTRC=~/.inputrc
export CATALINA_HOME=/home/za/etc/tomcat
export LESS='-I'
export PULSE_PROP="filter.want=echo-cancel"
export BAT_PAGER=less

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export LC_ALL=en_EN.UTF-8
# export LC_ALL=C

# export LC_CTYPE="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"
# export LANG="en_US.UTF-8"
# export LC_MESSAGES="en_US.UTF-8"

#export TERM=linux
#export PAGER="most"

#export LC_TIME=en_GB.UTF-8
#export LC_LANGUAGE=en_US:en
#export LC_MESSAGES=C
#export LC_ALL=C
#export LANG=ru_RU.UTF-8
#export LC_ALL=ru_RU.UTF-8
#export LANG=en_EN.UTF-8

export M2_HOME=/home/za/etc/apache-maven-3.3.9
export M2=%M2_HOME%/bin
export MAVEN_OPTS=-Xms256m
export _USE_XTERM_CURSOR_CODES=1
#set editing-mode vi
#set keymap vi-command
#set show-all-if-ambiguous on

# The following three lines have been added by UDB DB2.
if [ -f /home/za/sqllib/db2profile ]; then
    . /home/za/sqllib/db2profile
fi

# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

#source ~/.nvm/nvm.sh
#nvm use 0.10

#PS1='w: $(date +%V) \u@\h:\w'
PS1='[\u@ \w] '

HISTTIMEFORMAT='%t%F %T%t'
echo $PROMPT_COMMAND|grep -q bash_eternal_history || export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; } history -a; "'echo -e $?\\t$USER\\t$HOSTNAME\\t$PWD\\t"$(history 1)" >> ~/.bash_eternal_history'

alias nodejs='node'
alias mymp3gain='mp3gain -c -p -r -d 2.0'
alias diff='colordiff'
alias ls='ls --color'
alias tmux='TERM=xterm tmux'
alias grep='grep -niTH --color=auto'
#alias eapp='ssh masterlogger@eapp.e-vision.by'
alias cvslog='lastdiff.sh'
alias logviewer='ssh -oHostKeyAlgorithms=+ssh-dss -oKexAlgorithms=+diffie-hellman-group1-sha1 -i /home/za/.ssh/id_dsa masterlogger@192.168.6.22'
alias eapp='ssh 192.168.6.51'
#alias eapplog='ssh 192.168.6.51'
#alias evim='gvim -u /home/za/.vimrc-experimental'

alias exttidy='tidy -config /home/za/tidy.conf'
alias ll='ls -al'
alias lineCountTotal='find . -maxdepth 5 -type f  | xargs wc -l  | grep total'
alias lineCount='find . -maxdepth 5 -type f  | xargs wc -l'
alias mc='EDITOR=nvim mc'
alias bat='batcat'
alias tag='ctags -f ../tags -R'
alias nvm-latest='nvm install 18.13.0'

#alias ctags='/home/za/usr/bin/ctags'
#alias ctags='ctags -f /home/za/.tags'

fortune /usr/share/games/fortunes/ru | cowsay

eval "$(fzf --bash)"
#export VISUAL=nvim
#export EDITOR="$VISUAL"

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#[ -f ~/.fzf.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

#prevent Ctrl+S
stty -ixon

#export DISPLAY=:0.1 wine
export WINEPREFIX=/home/za/etc/wine

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

#for mouse
export GDK_CORE_DEVICE_EVENTS=1

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


# Load Angular CLI autocompletion.
# source <(ng completion script)

alias vimn="gvim -N -u /home/za/.vimrcnew"
