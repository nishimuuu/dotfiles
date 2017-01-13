
export PATH="$HOME/.rbenv/bin:$PATH"↓
export PATH="$HOME/Library/Haskell/bin:$PATH"

# z
# . `brew --prefix`/etc/profile.d/z.sh
# function precmd () {
#    z --add "$(pwd -P)"
#    }


###############################################
## 環境変数の設定セクション
###############################################

## 言語設定
##-----------------------
case "${OSTYPE}" in
  darwin9)
    ;;
  freebsd*|darwin*)
    export LANG=ja_JP.UTF-8                 #UTF-8のとき
    export LC_ALL=ja_JP.UTF-8
    ;;
  cygwin*)
    export LANG=ja_JP.UTF-8                 #UTF-8対応のCygwin使うとき
    export LC_ALL=ja_JP.UTF-8
    ;;
  linux*)
    ;;
esac

## Alt+LEFT or Alt+RIGHT, Move cursor for word
##-----------------------
# / を単語の一部とみなさない記号の環境変数から削除
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey ";5f" forward-word
bindkey ";5b" backward-word

# Emacs のシェルでやる場合
[[ $EMACS = t ]] && unsetopt zle
if [ "$EMACS" ];then
  export TERM=Eterm-color
fi


## リストの色つけ
##-----------------------

# ターミナルに応じてLSCOLORなどを設定
# http://geoff.greer.fm/lscolors/
case "${TERM}" in
  kterm*|xterm*)
    export LSCOLORS='gxfxcxdxbxegedabagacad'
    export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
    ;;
  cons25)
    export LSCOLORS='ExFxCxdxBxegedabagacad'
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    ;;
esac
export GEM_HOME=/opt/local/lib/ruby/gems/2.0
export RUBYLIB=/opt/local/lib/ruby/gems/2.0
export PATH=$PATH:/var/lib/gems/2.0/bin
export DOCKER_HOST=tcp://localhost:4243
export PATH=$PATH:/usr/texbin
export PATH=$PATH:/Library/TeX/texbin
export PATH=$PATH:/opt/myscript

eval "$(pyenv init -)"
eval "$(rbenv init -)"
### Virtualenvwrapper
if [ -f /Users/01010357/.pyenv/versions/2.7.11/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source /Users/01010357/.pyenv/versions/2.7.11/bin/virtualenvwrapper.sh
fi


#if [ -f /Users/01010357/.pyenv/versions/3.5.1/bin/virtualenvwrapper.sh ]; then
#  export WORKON_HOME=$HOME/.virtualenvs
#  source /Users/01010357/.pyenv/versions/3.5.1/bin/virtualenvwrapper.sh
#fi
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
 export ANDROID_HOME=/usr/local/opt/android-sdk


export HOMEBREW_CASK_OPTS="--appdir=/Applications"
