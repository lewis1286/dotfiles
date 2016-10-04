# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/lewisguignard/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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


alias ls="ls -G"
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
export JAVA_HOME
export PATH=/Users/lewisguignard/Documents/code/apache-maven-3.3.9/bin:$PATH

SCALA_HOME=/usr/local/Cellar/scala/2.11.8/
export SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin



# get python to import pyspark by setting these vars
export SPARK_HOME="$HOME/spark-1.6.1"
export PATH=$PATH:$SPARK_HOME
export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.9-src.zip:$PYTHONPATH
export PYTHONPATH=$HOME/anaconda/lib/python2.7/site-packages/:$PYTHONPATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/anaconda/bin:/usr/bin:/bin:/usr/sbin:/sbin"TH="$PATH:$HOME/anaconda/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# api code for Verisign API
export IDEF_TOKEN="vaS6wOPtpl0IIXGdnCejxKJTQpLrS3s8-VpTvuaSXYfYrvs107aAnlJ-HwCqdMhhhHWGLTykiL5TTibZc07i_Kw-QR_fItbAp_xVLWU6dI0mkdDkZY35py7XuYJp5pcfAvtOuXehGSJM23S86RobPlaW058X2Bmm1W0lS-j93S562ptx9qjWcXpI_dPl_n4yIFtBJAOeO4igU7bmAjWCO6hugX9fuDcE_LYP6MgV2AU"
export IDEF_URL="https://api.intelgraph.verisign.com/rest/"

#alias vim='/usr/local/Cellar/vim'

# raspberry pi connection
#alias spi="ssh pi@10.0.0.125"
