if test -d /opt/homebrew
  set -gx PATH /opt/homebrew/bin $PATH
  eval (/opt/homebrew/bin/brew shellenv)
  set -gx HOMEBREW_INSTALL_CLEANUP true
  set -gx HOMEBREW_NO_ANALYTICS true
  set -gx HOMEBREW_NO_ENV_HINTS true
  set -gx HOMEBREW_FORCE_BREWED_GIT true
end

if test -d /opt/local/share/macports
  set -gx PATH /opt/local/bin $PATH
end
