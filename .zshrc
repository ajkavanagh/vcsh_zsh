# Path to your oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse-with-bzr"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git ajk-magic-path)
plugins=(git)

# User configuration

export PATH="$PATH:/Users/alex/.gvm/bin:/Users/alex/.rvm/gems/ruby-2.0.0-p195/bin:/Users/alex/.rvm/gems/ruby-2.0.0-p195@global/bin:/Users/alex/.rvm/rubies/ruby-2.0.0-p195/bin:/Users/alex/.rvm/bin:/usr/local/sbin:/Users/alex/Local/bin:/usr/local/bin:/Users/alex/Local/nvm/versions/io.js/v1.3.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/alex/.gem/ruby/1.8/bin:/Users/alex/.rvm/bin"
export MANPATH="/usr/local/man:$MANPATH"

if [ -f $HOME/.config/shell-vars/homebrew.sh ]; then
	source $HOME/.config/shell-vars/homebrew.sh
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if (( $+commands[hub] )) ; then
  alias git=hub
fi

# if we're in OSX then we use iTerm so we get Cmd + <- and ->
# for beginning and end of line.
if [[ `uname` == 'Darwin' ]]; then
  bindkey "^[[H" beginning-of-line
  bindkey "^[[F" end-of-line
  alias ctags="`brew --prefix`/bin/ctags"
  export NVIM_TUI_ENABLE_TRUE_COLOR=1
fi

# we'd like vi keyboard bindings
bindkey -v
export KEYTIMEOUT=1
bindkey '^r' history-incremental-search-backward

# Add zsh-completions 
fpath=(/usr/local/share/zsh-completions $fpath)

# if you do rm *, zsh will give a sanity check
setopt RM_STAR_WAIT

# Interactive BASH style comments
setopt interactivecomments

# Let's correct spellings, shall we
setopt CORRECT

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export GOPATH=$HOME/Local/gopath
