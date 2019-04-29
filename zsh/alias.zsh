
alias dstart='docker-machine start dev; eval $(docker-machine env dev)'
alias dinit='docker-machine create --driver virtualbox'


##############################################################
##エイリアスの大量登録ゾーン########
##たぶんMacじゃないとうごかないよ##
alias fuck="networksetup -setairportpower en0 off; sleep 2; networksetup -setairportpower en0 on"

alias md='open -a Kobito'
alias java='java -Dfile.encoding=UTF-8'
alias javac='javac -J-Dfile.encoding=utf-8'
alias schedule='icalBuddy -nc eventsToday+7 | sed -e "s/*/-/"'
alias excel='open -a Microsoft\ Excel'
alias cot='open -a CotEditor'
alias coda='open -a Coda\ 2'
alias r='open -a R'
alias mail='open -a AirMail\ Beta'
alias oa='open -a'
alias memo='open -a ATOKPad'
alias line='open -a Line'
alias todo='open -a OmniFocus'
alias gra='open -a OmniGraffle'
alias gis='open -a QGIS'
alias sys='open -a System\ Preferences'
alias act='open -a Activity\ Monitor'
alias cal='open -a Calendar'
alias yoru='open -a YoruFukurou'
alias gem install= 'ARCHFLAG=-Wno-error=unused-command-line-argument-hard-error-in-future gem install'
alias l='ls -lha'
alias tf='terraform'

#javaのコンパイル時に　utf-8でコンパイル・実行
alias java='java -Dfile.encoding=UTF-8'
alias javac='javac -J-Dfile.encoding=utf-8'
alias schedule='icalBuddy -nc eventsToday+7 | sed -e "s/*/-/"'
alias excel='open -a Microsoft\ Excel'
alias cot='open -a CotEditor'
alias coda='open -a Coda\ 2'
alias r='open -a R'
alias mail='open -a AirMail\ Beta'
alias oa='open -a'
alias memo='open -a ATOKPad'
alias line='open -a Line'
alias todo='open -a OmniFocus'
alias gra='open -a OmniGraffle'
alias gis='open -a QGIS'
alias sys='open -a System\ Preferences'
alias filecount='ls | wc -l'
alias kp='knife solo prepare'
alias kc='knife solo cook'
alias kn='knife cookbook create'
alias vagrant new='vagrant destroy; vagrant up'
# vagrant用のエイリアス
alias vagrant new='vagrant halt; vagrant destroy; vagrant up'
alias code='cd $HOME/code'
# 一般のエイリアス
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -al"
alias e='emacs'
alias h='history'
alias ha='history-all'
alias psa='ps auxw'
alias po="popd"

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| sort'
alias -g A='| awk'
alias -g W='| wc'
alias -g U='| nkf -w'
alias -g N='| nkf'

# Gitのショートカット gs, gd, gl, ga
alias g="git"
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gl="git log --graph --decorate --branches --date=iso"
alias gll="git logg"
alias ga="git add ."
alias gc="git config -l"
alias gco="git commit"
alias gp="git push"
# Squid(HTTP Proxy)
alias squid="squid -N"

alias httpserver="python -mSimpleHTTPServer"


## 条件付きエイリアスの設定
##-----------------------

# PAGERはlvを優先し、無い場合はlessを使う
if type lv > /dev/null 2>&1; then
  export PAGER="lv"
else
  export PAGER="less"
fi

# irb => pryの設定
if type pry > /dev/null 2>&1; then
  alias irb="pry"
fi

# rvmがある場合はパスを通す
if type rvm > /dev/null 2>&1; then
  PATH=$PATH:$HOME/.rvm/bin
fi

if [ "$PAGER" = "lv" ]; then
  # -c: ANSIエスケープシーケンスの色付けなどを有効にする。
  # -l: 1行が長くと折り返されていても1行として扱う。
  #     （コピーしたときに余計な改行を入れない。）
  export LV="-c -l"
else
  # lvがなくてもlvでページャーを起動する。
  alias lv="$PAGER"
fi


## 環境依存のエイリアス設定
##-----------------------
case "${OSTYPE}" in
  darwin9)
    ;;
  darwin*)  # OSX only
    alias -g C='| pbcopy'
    alias gcc-gl="gcc -lglut -lGLU -lGL -framework glpng -L/usr/X11R6/lib/ -L/System/Library/Frameworks/glpng.framework"     # build with GL, GLUT, glpng lib on OSX
    alias unzip-sjis='/usr/local/bin/unzip-sjis.rb'
    ;;
  freebsd*)
    ;;
  cygwin*)
    alias apt-cyg='apt-cyg -u'
    alias open='cygstart'
    alias -g C='| clip'
    alias git="/usr/bin/git"
    ;;
  linux*)
    ;;
esac
