source ~/dotfiles/zsh/color.zsh
source ~/dotfiles/zsh/alias.zsh
source ~/dotfiles/zsh/function.zsh
source ~/dotfiles/zsh/opt.zsh
source ~/dotfiles/zsh/conf.zsh
source ~/dotfiles/zsh/export.zsh


export PATH=$PATH:/sbin
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
#export PATH=$PATH:/$HOME/dotfiles/scripts
export EDITOR=zsh
eval "$(direnv hook zsh)"
alias vim="/usr/local/bin/vim"
