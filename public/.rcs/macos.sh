# ---------------------------------- GraalVM --------------------------------- #
export GRAAL_JAVA_HOME="/Library/Java/VirtualMachines/graalvm-ee-java11-20.2.0/Contents/Home"
export GRAAL_PATH="/Library/Java/VirtualMachines/graalvm-ee-java11-20.2.0/Contents/Home/bin"
export JAVA_HOME="$GRAAL_JAVA_HOME"

# ----------------------------------- iTerm ---------------------------------- #
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ------------------------------ macOS CLI Trash ----------------------------- #
alias rm='trash'
