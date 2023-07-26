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

if test \( "$ELLIPSIS_PLATFORM" = "macos" \) -a \( -d "$HOME/Dropbox" \)
  set -gx DROPBOX_PATH "$HOME/Dropbox"
else if test \( "$ELLIPSIS_PLATFORM" = "macos" \) -a \( -d "$HOME/Library/CloudStorage/Dropbox" \)
  set -gx DROPBOX_PATH "$HOME/Library/CloudStorage/Dropbox"
else if test "$ELLIPSIS_PLATFORM" = "wsl"
  set -gx DROPBOX_PATH "/mnt/c/Dropbox"
end

set -gx CAROOT "$DROPBOX_PATH/Settings/SSL"
set -gx NODE_EXTRA_CERTS "$CAROOT/rootCA.pem"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -g async_prompt_functions _pure_prompt_git

# string match -r -q '^vscode$' "$TERM_PROGRAM" and source (code --locate-shell-integration-path fish)

if status --is-interactive
  keychain --ignore-missing --quiet --eval -Q ~/.ssh/personal_ed25519 ~/.ssh/personal_rsa | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/daniel/miniconda3/bin/conda
    eval /Users/daniel/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
