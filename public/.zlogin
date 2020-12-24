#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

{
  if [[ -d "$HOME/.ellipsis" ]]; then
    cd "$HOME/.ellipsis"

    [[ -n $(git status --short) ]] && return

    git pull
  fi
} &!
