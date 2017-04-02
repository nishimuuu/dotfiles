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


