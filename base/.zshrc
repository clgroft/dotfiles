# zmodload zsh/zprof

export ZSH=~/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true

plugins=(
  bgnotify
  brew
  cabal
  common-aliases
  colored-man-pages
  dotenv
  encode64
  gem
  git
  git-extras
  gitfast
  github
  golang
  httpie
  jira
  nvm
  pip
  pylint
  python
  rails
  ruby
  tmux
  vi-mode
  web-search
  yarn
  zsh_reload
)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

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

source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
