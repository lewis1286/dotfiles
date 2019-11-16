# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f $HOME/.aliases ]
then
    source $HOME/.aliases
fi

if [ -f $HOME/.local_aliases ]
then
    source $HOME/.local_aliases
fi

if [ -f $HOME/.local_paths ]
then
    source $HOME/.local_paths
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export KEYTIMEOUT=1

export EDITOR='nvim'

# Use antigen package management
source $HOME/.zsh/antigen.zsh


# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

## Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle pip
#antigen bundle command-not-found

## Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
## Load the theme.
#antigen theme robbyrussell

## Tell Antigen that you're done.
#antigen apply


source $ZSH/oh-my-zsh.sh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME=${ZSH_THEME:-cloud}
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# will need to: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# and:git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins=(
    git
    python
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# -----------------------------------------------------
# ------------------- vi mode -------------------------
# -----------------------------------------------------

bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# -----------------------------------------------------

