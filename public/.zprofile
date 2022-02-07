
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

autoload -U bashcompinit
bashcompinit

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

if [[ "$(uname -s)" == "Darwin" ]]; then
  export ELLIPSIS_PLATFORM="macos"
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" =~ "microsoft" ]]; then
  export ELLIPSIS_PLATFORM="wsl"
fi

if [[ "$ELLIPSIS_PLATFORM" == "macos" && -e "$HOME/Dropbox" ]]; then
  export DROPBOX_PATH="$HOME/Dropbox"
elif [[ "$ELLIPSIS_PLATFORM" == "macos" && -e "$HOME/Library/CloudStorage/Dropbox" ]]; then
  export DROPBOX_PATH="$HOME/Library/CloudStorage/Dropbox"
elif [[ "$ELLIPSIS_PLATFORM" == "wsl" && -e "/mnt/c/Dropbox" ]]; then
  export DROPBOX_PATH="/mnt/c/Dropbox"
fi

if [[ "$ELLIPSIS_PLATFORM" == "wsl" ]]; then
  path=(
    /home/linuxbrew/.linuxbrew/bin
    $path
  )
fi

fpath=(
  ${HOMEBREW_PREFIX}/share/zsh/site-functions
  ${HOMEBREW_PREFIX}/share/zsh-completions
  $fpath
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
