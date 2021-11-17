# ----------------------------- Homebrew ZSH Help ---------------------------- #
unalias run-help &> /dev/null
autoload run-help
export HELPDIR="$HOMEBREW_PREFIX/share/zsh/helpfiles:$HELPDIR"

# --------------------------------- MacPorts --------------------------------- #
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:/opt/homebrew/share/man:$MANPATH"
export DISPLAY=:0

# ---------------------------------- GraalVM --------------------------------- #
export GRAAL_VERSION=graalvm-ee-java11-21.2.0
export GRAAL_JAVA_HOME="/Library/Java/JavaVirtualMachines/$GRAAL_VERSION/Contents/Home"
export GRAAL_PATH="/Library/Java/JavaVirtualMachines/$GRAAL_VERSION/Contents/Home/bin"
# export JAVA_HOME="$(/usr/libexec/java_home)"

# ----------------------------------- iTerm ---------------------------------- #
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ------------------------------ macOS CLI Trash ----------------------------- #
alias tm='trash'

# ---------------------------------- mkcert ---------------------------------- #
export CAROOT="$HOME/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"

# --------------------------------- dircolors -------------------------------- #
eval "$(gdircolors -b "$HOME/.dircolors/phyllisstein")"

# ---------------------------------- Netlify --------------------------------- #
test -f "$HOME/Library/Preferences/netlify/helper/path.zsh.inc" && source "$HOME/Library/Preferences/netlify/helper/path.zsh.inc"

# ---------------------------------- Python ---------------------------------- #
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PYTHONPATH="$HOME/Library/Python/3.9/site-packages:$PYTHONPATH"
