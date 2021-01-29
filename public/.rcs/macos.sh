# ---------------------------------- GraalVM --------------------------------- #
export GRAAL_JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-ee-java11-21.0.0/Contents/Home"
export GRAAL_PATH="/Library/Java/JavaVirtualMachines/graalvm-ee-java11-21.0.0/Contents/Home/bin"

# ----------------------------------- iTerm ---------------------------------- #
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ------------------------------ macOS CLI Trash ----------------------------- #
alias tm='trash'

# ---------------------------------- mkcert ---------------------------------- #
export CAROOT="$HOME/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"
