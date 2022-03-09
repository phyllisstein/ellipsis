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

if test (uname -s) = "Darwin"
  set -gx ELLIPSIS_PLATFORM "macos"
else if test \( (uname -s) = "Linux" \) -a \( string match --ignore-case "microsoft" (uname -r) \)
  set -gx ELLIPSIS_PLATFORM "wsl"
end

if test \( "$ELLIPSIS_PLATFORM" = "macos" \) -a \( -e "$HOME/Dropbox" \)
  set -gx DROPBOX_PATH "$HOME/Dropbox"
else if test \( "$ELLIPSIS_PLATFORM" = "macos" \) -a \( -e "$HOME/Library/CloudStorage/Dropbox" \)
  set -gx DROPBOX_PATH "$HOME/Library/CloudStorage/Dropbox"
else if test "$ELLIPSIS_PLATFORM" = "wsl"
  set -gx DROPBOX_PATH "/mnt/c/Dropbox"
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

