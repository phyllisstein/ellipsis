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
