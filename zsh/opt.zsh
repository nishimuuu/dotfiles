
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
GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"

# 色を付ける。
GREP_OPTIONS="--color=auto $GREP_OPTIONS"




