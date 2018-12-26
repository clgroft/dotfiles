# zmodload zsh/zprof

source /usr/local/share/antigen/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir rbenv rvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(\
  status load root_indicator background_jobs command_execution_time history\
  time)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_SHORTEN_DIR_LENGTH=0
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_with_package_name
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_RVM_FOREGROUND="white"

antigen init .antigenrc

eval $(thefuck --alias)
eval $(brew command-not-found-init)

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim' # vimr isn't quite working the way I want
fi

[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  export NVM_DIR="$HOME/.nvm"
  source /usr/local/opt/nvm/nvm.sh
fi

export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin"

# ~/.zshrc_local should contain DEFAULT_USER and GITHUB_USERNAME
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias gacm="gaa && gcmsg"
alias exa="exa -lh --git"

# zprof
