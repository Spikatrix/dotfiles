# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	colored-man-pages
	zsh-autosuggestions
)

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

# OMZ, don't delete the space before | and &
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# CTRL + Space for advancing one word in autosuggestions
bindkey '^ ' forward-word

# Disables the user@hostname thingy
prompt_context() { }

unlockMyPhone() {
	if [ "$1" = "FORCE" ]; then
		adb shell input keyevent 26 # Wakey wakey
	fi
	adb shell input touchscreen swipe 360 1140 360 220
	adb shell input text 12345
	adb shell input tap 606 1135
}

# scrcpy is better
castPhoneScreen() {
	adb exec-out screenrecord --bit-rate=16m --output-format=h264 --size 1280x720 - | ffplay -
}

alias shitdown="echo 'Shitting down...' && sleep 1 && shutdown now"
alias zzzzzzzzzzzzzz="systemctl suspend"
alias getGitToken="cat ~/Documents/LRC\ Editor/Keystore\,\ Docs\ and\ scripts/Git\ Access\ Token.txt | tail -1 | xsel -ib"
alias cb='chromium-browser > /dev/null 2>&1 &'
alias discordo='discord > /dev/null 2>&1 &'
alias anst='~/Downloads/android-studio/bin/studio.sh &'
alias arc='file-roller'
alias ctrlpanel='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center &' # In i3wm, the env var is needed
alias audioctrl='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center sound &' # In i3wm, the env var is needed

export PATH="$PATH:/home/jas/Downloads/flutter/flutter/bin"
alias vim=/usr/local/bin/vim
alias vi=/usr/bin/vim

# Unused as xbacklight takes care of it, but useful as a fallback in case of issues (which never happened with the current xbacklight)
setBrightness() {
	if [ "$1" -eq "$1" ]; then
		echo "$1" > /sys/class/backlight/intel_backlight/brightness
	fi
}

alias ls="exa"
. /usr/local/bin/z.sh

# So that less searches appear in the middleish of the screen rather than the top
export LESS="-R -j.45"

# Editor of choice vim 8.2 rather than vim 7.4
export VISUAL=vim
export EDITOR="$VISUAL"

alias rm="rm -i"
