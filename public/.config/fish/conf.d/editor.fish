set -gx CODE_INSIDERS (which code-insiders)
set -gx CODE_MAINLINE (which code)

set -gx EDITOR "$CODE_MAINLINE --wait"
set -gx VISUAL "$EDITOR"
set -gx GIT_EDITOR "$EDITOR"
