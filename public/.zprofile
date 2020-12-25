#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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

__uname_value="$(uname -s)"
if [[ "$__uname_value" == "Darwin" ]]; then
  export ELLIPSIS_PLATFORM="macos"
elif [[ "$__uname_value" == "Linux" && -d /mnt/c ]]; then
  export ELLIPSIS_PLATFORM="wsl"
fi

if [[ "$ELLIPSIS_PLATFORM" == "wsl" ]]; then
  path=(
    /home/linuxbrew/.linuxbrew/bin
    $path
  )

fi

export HOMEBREW_PREFIX="$(brew --prefix)"

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

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
