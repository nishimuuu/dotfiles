source ~/dotfiles/zsh/color.zsh
source ~/dotfiles/zsh/alias.zsh
source ~/dotfiles/zsh/function.zsh
source ~/dotfiles/zsh/opt.zsh
source ~/dotfiles/zsh/conf.zsh
source ~/dotfiles/zsh/export.zsh


export PATH=$PATH:/sbin
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
#export PATH=$PATH:/$HOME/dotfiles/scripts
export EDITOR=zsh
eval "$(direnv hook zsh)"
alias vim="/opt/homebrew/bin/vim"

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
