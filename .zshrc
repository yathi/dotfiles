# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# load rbenv automatically
eval "$(rbenv init - zsh)"

# This is needed to ensure that vim is used by applications which need the editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Aliases¬
alias ets="ember test --serve"
alias eb="ember build --environment production"
alias ebw="ember build --environment production --watch"
alias etsm="ember test --serve --module"
alias st="git status"

alias rs="rails s"
alias rc="rails c"
alias be="bundle exec"
alias bers="bundle exec rspec"
alias bera="bundle exec rake"
alias jcl="rake jobs:clear"
alias jw="rake jobs:work"
alias jwo="rake jobs:workoff"
alias v='nvim'

# git
alias grc="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"

# Remapping `ls` to make it easier to use on a dvorak layout.
alias no="ls"

# aliases for nearley
alias nt="nearley-test"
alias nearc="nearleyc"

eval $(thefuck --alias)
eval "$(rbenv init -)"

# Loads autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Source autocompletions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-execute

export PATH="$HOME/.rbenv/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
