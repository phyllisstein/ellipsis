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

if test (uname -s) = Darwin
    set -gx ELLIPSIS_PLATFORM macos
else if test \( (uname -s) = Linux \) -a \( string match --ignore-case microsoft (uname -r) \)
    set -gx ELLIPSIS_PLATFORM wsl
end

if test \( "$ELLIPSIS_PLATFORM" = macos \) -a \( -d "$HOME/Dropbox" \)
    set -gx DROPBOX_PATH "$HOME/Dropbox"
else if test \( "$ELLIPSIS_PLATFORM" = macos \) -a \( -d "$HOME/Library/CloudStorage/Dropbox" \)
    set -gx DROPBOX_PATH "$HOME/Library/CloudStorage/Dropbox"
else if test "$ELLIPSIS_PLATFORM" = wsl
    set -gx DROPBOX_PATH /mnt/c/Dropbox
end

set -gx CAROOT "$DROPBOX_PATH/Settings/SSL"
set -gx NODE_EXTRA_CERTS "$CAROOT/rootCA.pem"

set -gx NEXT_TELEMETRY_DISABLED 1

zoxide init fish | source
starship init fish | source
# oh-my-posh init fish | source

# pyenv init - | source

set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock

if string match -q "$TERM_PROGRAM" "iTerm.app"
    test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish
end
if string match -q "$TERM_PROGRAM" WarpTerminal or string match -q "$TERM_PROGRAM" vscode
    set -x fish_autosuggestion_enabled 0
else
    set -x fish_autosuggestion_enabled 1
end

function edit-command-line
    # Create a temporary file securely
    set -l tmpfile (mktemp /tmp/fish_edit_command.XXXXXX)

    # Write the current command line to the temporary file without escaping
    commandline >$tmpfile

    # Open the temporary file in the editor specified by $EDITOR
    # Since EDITOR is a list, it handles the command and its arguments correctly
    $EDITOR $tmpfile

    # Check if the temporary file still exists (in case the editor was closed unexpectedly)
    if test -f $tmpfile
        # Read the edited content, trimming any trailing whitespace
        set -l edited (string trim (cat $tmpfile))

        # Replace the current command line with the edited content
        commandline -r "$edited"

        # Remove the temporary file to clean up
        rm $tmpfile
    end
end

# Bind Ctrl+x to the edit_command_line function
bind \cx edit-command-line

function insert-dot
    # Get the text before the cursor
    set current_before_cursor (commandline -t)

    # Get the last two characters before the cursor
    set last_two (string sub -s -2 "$current_before_cursor")

    if test "$last_two" = ".."
        # If the last two characters are '..', insert '/..'
        commandline -i "/.."
    else
        # Otherwise, insert a single '.'
        commandline -i "."
    end
end

bind '.' insert-dot

if string match -q "$TERM_PROGRAM" vscode
    source (code --locate-shell-integration-path fish)
end

bass source ~/.nvm/nvm.sh --no-use ';' nvm use default

eval (perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5) || true

# pnpm
set -gx PNPM_HOME /Users/daniel/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
else if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

# pnpm end
