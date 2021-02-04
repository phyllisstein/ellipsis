#!/bin/zsh

set -eEuxo pipefail

if [ $UID -eq 0 ]; then
    exec su daniel "${(%):-%N}"
fi

mkdir -p "$HOME/.local/var/machine-state" && cd "$HOME/.local/var/machine-state"

if [[ -x /usr/local/bin/brew ]]; then
    /usr/local/bin/brew list --full-name > "brew.txt"
    /usr/local/bin/brew list --full-name --cask > "brew-cask.txt"
fi

/bin/ls /Applications | /usr/bin/sed 's|\.app||' > "applications.txt"

/bin/ls /Applications/Setapp | /usr/bin/sed 's|\.app||' > "setapp-applications.txt"

[[ -x /usr/local/bin/code-insiders ]] && /usr/local/bin/code-insiders --list-extensions > "vscode-insiders.txt"

[[ -x /usr/local/bin/code ]] && /usr/local/bin/code --list-extensions > "vscode.txt"

[[ -x /Users/daniel/.asdf/bin/asdf ]] && /Users/daniel/.asdf/bin/asdf list > "asdf.txt"
