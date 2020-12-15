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

export HOMEBREW_PREFIX=$(brew --prefix)

# Set the list of directories that Zsh searches for programs.
path=(
  ${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/gnu-which/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/gsed/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/gnu-indent/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/make/libexec/gnubin
  ${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin
  ${HOMEBREW_PREFIX}/{bin,sbin}
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
