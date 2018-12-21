export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir rvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(\
  status load root_indicator background_jobs command_execution_time time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=0
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_with_package_name
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_RVM_FOREGROUND="white"

plugins=(
  bgnotify
  brew
  colored-man-pages
  command-not-found
  dotenv
  encode64
  git
  httpie
  jira
  nvm
  rails
  ruby
  tmux
  vi-mode
  web-search
  yarn
)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
eval $(brew command-not-found-init)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim' # vimr isn't quite working the way I want
fi

source ~/.iterm2_shell_integration.zsh

export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh

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

source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

