
#############################################################
##環境変数の設定セクション（にしむら）##
export PATH="$HOME/.rbenv/bin:$PATH"↓
export PATH="$HOME/Library/Haskell/bin:$PATH"

# z
# . `brew --prefix`/etc/profile.d/z.sh
# function precmd () {
#    z --add "$(pwd -P)"
#    }


##############################################################
##エイリアスの大量登録ゾーン########
##たぶんMacじゃないとうごかないよ##

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

# vagrant用のエイリアス
alias vagrant new='vagrant halt; vagrant destroy; vagrant up'

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

case "${OSTYPE}" in
  darwin9)
    alias ls="ls --color"
    ;;
  freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
  cygwin*)
    # Cygwinで日本語表示用,なぜかコマンドラインからzshすると無効になる
    alias ls='ls --color=auto --show-control-chars'
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac

## Grepの設定
##-----------------------

# デフォルトオプションの設定
export GREP_OPTIONS

# バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"

# 管理用ディレクトリを無視する。
if grep --help | grep -q -- --exclude-dir; then
  GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi

# 可能なら色を付ける。
if grep --help | grep -q -- --color; then
  GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi


###############################################
## ZShellの設定セクション
###############################################

## 機能の有効化とZStyle
##-----------------------
autoload -U promptinit ; promptinit
autoload -U colors     ; colors
autoload -U compinit   ; compinit -u

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'                                       # 補完候補の大文字小文字の違いを無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'                            # さらなる曖昧なマッチ
zstyle ':completion:*:default' menu select=1                                              # 補完候補を←↓↑→で選択
zstyle ':completion:*' use-cache true                                                     # 補完キャッシュ
zstyle ':completion:*:processes' command 'ps x'                                           # kill で 'ps x' のリストから選択可能
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'         # kill の候補にも色付き表示
zstyle ':completion:*' use-compctl false                                                  # compctl形式を使用しない
zstyle ':completion:*:cd:*' tag-order local-directories path-directories                  # カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}                             # 補完候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'         # kill の候補にも色付き表示
zstyle ':completion:*' list-colors $LS_COLORS                                             # 選択候補はLS_COLORSに準ずる

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
  _oldlist _complete _match _history _ignored _approximate _prefix

# 補完候補のグループ分け [<b>%d</b>]
#zstyle ':completion:*' format "%B%{${bg[magenta]}%}[%d]%b%{$reset_color%}"
zstyle ':completion:*' group-name ''

# バージョン管理用のzstyle
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz is-at-least

if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr   "S"    # ステージングに追加
  zstyle ':vcs_info:git:*' unstagedstr "U"
  # %s = git, %b = branch, %a = action_format e.g.) merge conflict, %c = stagedstr, %u = unstaged
  zstyle ':vcs_info:git:*' formats '[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '[%b|%a] %c%u'
fi

# コマンド実行前にVCSをチェック
function _update_vcs_info_msg() {
psvar=()
LANG=en_US.UTF-8 vcs_info
[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# Cygwinだとくっそ遅いのでやめる
case "${OSTYPE}" in
  linux*|darwin*)
    add-zsh-hook precmd _update_vcs_info_msg
    ;;
  cygwin*)
    ;;
esac


## プロンプトの設定
##-----------------------

# 記念日までの日数を計算し、右のプロンプトに表示する
# OSXとGNUのdateは仕様が違うので注意
#NOW_TIME=`date +%s`
#case "${OSTYPE}" in
#  darwin9)
#      ANNIBERSARY_TIME=`date --date=20130930 +%s`
#          ;;
#	    darwin*)
  #	        ANNIBERSARY_TIME=`date -jf "%Y-%m-%d" "2013-09-30" "+%s"`
  #		    ;;
#		      cygwin*|freebsd*|linux*)
  #		          ANNIBERSARY_TIME=`date --date=20130930 +%s`
  #			      ;;
  #			      esac
  #			      SEC=$[$ANNIBERSARY_TIME-$NOW_TIME]
  #			      DAYS=$[ $SEC/60/60/24 ]

  # 記念日を整形
  # バージョン管理されている場所ではその情報を、
  # そうでないところでは記念日までのカウントダウン
  #ANNI_STR="%1(v|%{${fg[white]}%}%{${bg[cyan]}%}%1v%f|*INTERN'13 -> $DAYS days*)"

  # rootユーザー(uid=0)と一般ユーザーのプロンプトの色を区別する
  case ${UID} in
    0)
      # rootは真っ赤
      PROMPT="%{$reset_color%}%{$fg[white]%}%{$bg[red]%}$USER@%m#%{$reset_color%} "
      ;;
    *)
      PROMPT=$'[%{\e[38;05;$[150]m%}$USER%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}%t% ]%{\e[38;05;$[$RANDOM % 256]m%}% %% %{${reset_color}%}'
      ;;
  esac

  # 右プロンプトのディレクトリは256色をランダム
  # show_colors でわかるよ
  RPROMPT=$'%{$reset_color%}%{\e[38;05;$[$RANDOM % 256]m%}[%~]$ANNI_STR%{\e[m%}'

  # コマンドの自動訂正プロンプト
  # 文字が点滅するよ
  SPROMPT=$'\x1b[5m%{${fg[red]}%}%r\x1b[25m %{${reset_color}%}is %{${fg[green]}%}correct%{${reset_color}%}? [%{${fg[red]}%}n%{${reset_color}%},%{${fg[green]}%}y%{${reset_color}%}]: '

  # SSH接続の時はプロンプトの先頭にホスト名が表示される
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[magenta]}%}@@REMOTE%{$reset_color%} ${PROMPT}"


  ## ウィンドウタイトルの設定
  ##-----------------------

  ## 実行中のコマンドとユーザ名とホスト名とカレントディレクトリを表示。
  update_title() {
    local command_line=
    typeset -a command_line
    command_line=${(z)2}
    local command=
    if [ ${(t)command_line} = "array-local" ]; then
      command="$command_line[1]"
    else
      command="$2"
    fi
    print -n -P "\e]2;"
    echo -n "(${command})"
    print -n -P " %n@%m:%~\a"
  }
  ## X環境上でだけウィンドウタイトルを変える。
  if [ -n "$DISPLAY" ]; then
    preexec_functions=($preexec_functions update_title)
  fi


  ## ヒストリの設定
  ##-----------------------

  HISTFILE=~/.zsh_history
  HISTSIZE=10000000000
  SAVEHIST=10000000000

  # 履歴検索、Ctrl+P, Ctrl+Nでヒストリから検索
  autoload history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey '^P' history-beginning-search-backward
  bindkey '^N' history-beginning-search-forward

  # 部分合致履歴検索: Ctrl+Rで戻り、Ctrl+Sでその逆
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward


  ## 予測補完の設定
  ## Ctrl+x pでON、Ctrl+x Ctrl+pでOFF
  ##-----------------------

  # 履歴による予測入力 (man zshcontrib)
  autoload -U predict-on
  zle -N predict-on
  zle -N predict-off
  bindkey '^xp'  predict-on
  bindkey '^x^p' predict-off


  ## キーバインドの設定
  ##-----------------------

  # emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes to end of it)
  bindkey -e


  ## 各オプションの設定
  ##-----------------------

  #limit   coredumpsize    0      # コアファイルを吐かないようにする(Cygwinだと使用不可)
  #setopt auto_correct            # 補完時にスペルチェック
  #setopt correct_all             # コマンドライン全てのスペルチェックをする
  #setopt ignore_eof               # C-dでログアウトしない
  #setopt interactive_comments    # コマンド入力中のコメントを認める
  #setopt no_checkjobs            # ログアウト時にバックグラウンドジョブを確認しない
  #setopt no_hup                  # ログアウト時にバックグラウンドジョブをkillしない
  #setopt no_unset                 # 未定義変数の使用禁止(RVM使用時にエラーのもと)
  #setopt print_exit_value         # 戻り値が 0 以外の場合終了コードを表示
  #setopt rm_star_wait            # rm * を実行する前に確認
  #setopt sun_keyboard_hack       # SUNキーボードでの頻出 typo ` をカバーする
  #setopt xtrace                  # コマンドラインがどのように展開され実行されたかを表示する
  setopt always_last_prompt       # カーソル位置は保持したままファイル名一覧を順次その場で表示
  setopt append_history           # 履歴を追加 (毎回 .zhistory を作るのではなく)
  setopt auto_cd                  # ディレクトリ名のみで移動可能にする
  setopt auto_list                # Ctrl+iで補完可能な一覧を表示する(補完候補が複数ある時に、一覧表示)
  setopt auto_menu                # 補完キー連打で順に補完候補を自動で補完
  setopt auto_name_dirs           # "~$var" で変数展開後にディレクトリ移動
  setopt auto_param_keys          # カッコの対応などを自動的に補完
  setopt auto_param_slash         # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
  setopt auto_pushd               # 普通に cd するときにもディレクトリスタックにそのディレクトリを入れる
  setopt auto_resume              # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
  setopt brace_ccl                # ブレース展開機能を有効にする
  setopt bsd_echo
  setopt cdable_vars sh_word_split
  setopt complete_aliases         # aliased ls needs if file/dir completions work
  setopt complete_in_word         # 語の途中でもカーソル位置で補完
  setopt correct                  # スペルミスを補完
  setopt equals                   # =COMMAND を COMMAND のパス名に展開
  setopt extended_glob            # 拡張グロブを有効にする
  setopt extended_history         # 履歴ファイルに開始時刻と経過時間を記録
  setopt hash_cmds                # 各コマンドが実行されるときにパスをハッシュに入れる
  setopt hist_expand              # 補完時にヒストリを自動的に展開
  setopt hist_ignore_all_dups     # 重複するコマンド行は古い方を削除
  setopt hist_ignore_dups         # 直前と同じコマンドラインはヒストリに追加しない
  setopt hist_ignore_space        # スペースで始まるコマンド行はヒストリから削除 (→ 先頭にスペースを入れておけば、ヒストリに保存されない)
  setopt hist_no_store            # historyコマンドは履歴に登録しない
  setopt hist_reduce_blanks       # 余分な空白は詰めて記録
  setopt hist_save_no_dups        # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する。
  setopt inc_append_history       # 履歴をインクリメンタルに追加
  setopt list_packed              # コンパクトに補完リストを表示
  setopt list_types               # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
  setopt long_list_jobs           # 内部コマンド jobs の出力をデフォルトで jobs -L にする
  setopt magic_equal_subst        # コマンドラインの引数で --PREFIX=/USR などの = 以降でも補完できる
  setopt mail_warning
  setopt mark_dirs                # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
  setopt multios                  # 複数のリダイレクトやパイプなど、必要に応じてteeやcatを使う
  setopt no_beep                  # コマンド入力エラーでBeepを鳴らさない
  setopt noautoremoveslash        # 補完で末尾に補われた / を自動的に削除しない
  setopt nolistbeep               # no beep sound when complete list displayed
  setopt notify                   # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる
  setopt numeric_glob_sort        # 数字を数値と解釈してソートする
  setopt path_dirs                # コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
  setopt print_eight_bit          # 補完候補リストの日本語を適正表示
  setopt prompt_subst             # ESCエスケープを有効にする
  setopt pushd_ignore_dups        # ディレクトリスタックに重複する物は古い方を削除
  setopt pushd_silent             # pushd,popdの度にディレクトリスタックの中身を表示しない
  setopt pushd_to_home            # pushd 引数ナシ == pushd $HOME
  setopt rm_star_silent           # rm * を実行する前に確認しない
  setopt share_history            # 履歴の共有
  setopt short_loops              # FOR, REPEAT, SELECT, IF, FUNCTION などで簡略文法が使えるようになる
  unsetopt flow_control           # (shell editor 内で) C-s, C-q を無効にする
  unsetopt hist_verify            # ヒストリを呼び出してから実行する間に一旦編集可能を止める
  unsetopt menu_complete          # 補完の際に、可能なリストを表示してビープを鳴らすのではなく、最初にマッチしたものをいきなり挿入、はしない
  unsetopt no_clobber             # リダイレクトで上書きを許可する
  unsetopt promptcr               # 改行のない出力をプロンプトで上書きするのを防ぐ
  unsetopt ignoreeof              # Ctrl+dでログアウト可能にする


  ###############################################
  ## エイリアス・関数の定義セクション
  ###############################################

  ## エイリアスの設定
  ##-----------------------

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

  # Squid(HTTP Proxy)
  alias squid="squid -N"


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


  ## 関数類
  ##-----------------------

  # CPU 使用率の高い方から8つ表示する
  function pst() {
  psa | head -n 1
  psa | sort --reverse --numeric-sort --key=2 | grep -v "ps -auxww" | grep -v grep | head -n 8
}

# メモリ占有率の高い方から8つ表示する
function psm() {
psa | head -n 1
psa | sort --reverse --numeric-sort --key=3 | grep -v "ps -auxww" | grep -v grep | head -n 8
}

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# packman***=ファイルを指定エンコードで強制上書き
# EUCに変換
function packmanEUC() {
if [ $# != 0 ]; then
  for i in $*; do
    mv =(nkf -s $i) $i
  done
fi
}

#SJISに変換
function packmanSJIS() {
if [ $# != 0 ]; then
  for i in $*; do
    mv =(nkf -s $i) $i
  done
fi
}

# UTF-8に変換
function packmanUTF8() {
if [ $# != 0 ]; then
  for i in $*; do
    mv =(nkf -w $i) $i
  done
fi
}

# 行末表現をLFに変換
function packmanLF() {
if [ $# != 0 ]; then
  for i in $*; do
    mv =(nkf -Lu $i) $i
  done
fi
}

# 行末表現をCRLFに変換
function packmanCRLF() {
if [ $# != 0 ]; then
  for i in $*; do
    mv =(nkf -Lw $i) $i
  done
fi
}


# 使える色をすべて表示(カスタマイズの時とか)
function show_colors(){
for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

# CPUを8秒以上使った時は統計を表示
REPORTTIME=8
TIMEFMT="\
  The name of this job.             :%J
CPU seconds spent in user mode.   :%U
CPU seconds spent in kernel mode. :%S
Elapsed time in seconds.          :%E
The  CPU percentage.              :%P"


## ZShellのエンハンス
##----------------------

# リアルタイムシンタックスハイライティングの有効化
if [ -d "$HOME/.dotfiles/zsh-syntax-highlighting/" ]; then
  source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# コマンド補完の強化
if [ -d "$HOME/.dotfiles/zsh-completions" ]; then
  fpath=(~/.dotfiles/zsh-completions/src $fpath)
fi


## 個人情報を含む設定をインクルード
##-----------------------

if [ -e ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi


DIRSTACKSIZE=100
setopt AUTO_PUSHD

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
export PATH=/usr/local/bin:$PATH


export GEM_HOME=/opt/local/lib/ruby/gems/2.0
export RUBYLIB=/opt/local/lib/ruby/gems/2.0
export PATH=$PATH:/var/lib/gems/2.0/bin
export DOCKER_HOST=tcp://localhost:4243
