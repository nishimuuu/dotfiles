
###############################################
## zshの設定セクション
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


  # rootユーザー(uid=0)と一般ユーザーのプロンプトの色を区別する
  case ${UID} in
    0)
      # rootは真っ赤
      PROMPT="%{$reset_color%}%{$fg[white]%}%{$bg[red]%}$USER@%m#%{$reset_color%} "
      ;;
    *)
      PROMPT='[%F{green}%B%n%b%f]# '
      ;;
  esac

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
#RPROMPT='%F{magenta}[%~]'
RPROMPT='%1(v|%F{green}%1v(%~)'

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
