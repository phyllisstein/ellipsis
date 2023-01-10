source "$HOME/.rcs/prezto.sh"

# source "$HOME/.rcs/oh-my-zsh.sh"

source "$HOME/.rcs/shared.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/daniel/.asdf/installs/python/miniconda3-latest/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/daniel/.asdf/installs/python/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/Users/daniel/.asdf/installs/python/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/Users/daniel/.asdf/installs/python/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /Users/daniel/.docker/init-zsh.sh || true # Added by Docker Desktop
