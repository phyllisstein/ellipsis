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
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
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
  /usr/local/opt/gnu-sed/libexec/gnubin
  /usr/local/opt/gnu-which/libexec/gnubin
  /usr/local/opt/gsed/libexec/gnubin
  /usr/local/opt/grep/libexec/gnubin
  /usr/local/opt/gnu-indent/libexec/gnubin
  /usr/local/opt/gnu-tar/libexec/gnubin
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/make/libexec/gnubin
  /usr/local/opt/findutils/libexec/gnubin
  /usr/local/{bin,sbin}
  $path
)

fpath=(
  /usr/local/share/zsh/site-functions
  /usr/local/share/zsh-completions
  $fpath
)

export HOMEBREW_PREFIX=$(brew --prefix)

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

export PATH="$HOME/.cargo/bin:$PATH"
