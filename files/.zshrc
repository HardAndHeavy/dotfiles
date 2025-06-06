# hardandheavy{{
# Vim alias
alias vi="nvim"
alias vim="nvim"
# cache
export ZDOTDIR="$HOME/.zsh"
if [ ! -d "$ZDOTDIR" ]; then mkdir -p "$ZDOTDIR"; fi
# }}hardandheavy

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# hardandheavy{{
PROMPT="%{$fg[cyan]$USER%}%{$fg[green]@%m%} ${PROMPT}"
# }}hardandheavy
