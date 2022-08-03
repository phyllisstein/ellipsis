#!/usr/bin/env zsh

autoload -U regexp-replace
autoload -U zmv
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -Ls'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# -------------------------- Breakaway Config Files -------------------------- #
test -f "$HOME/.rcs/${ELLIPSIS_PLATFORM}.sh" && source "$HOME/.rcs/${ELLIPSIS_PLATFORM}.sh"

for dot in $HOME/.rcs/{aliases,functions,environment,secrets,options}.sh; do
  test -f "$dot" && source "$dot"
done

# ------------------------------ Shell Utilities ----------------------------- #
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

[[ -f "${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh" ]] && source "${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh"

[[ -f "${HOME}/.kubectl-aliases/.kubectl_aliases" ]] && source "${HOME}/.kubectl-aliases/.kubectl_aliases"

if hash kubectl &>/dev/null; then
  source <($HOMEBREW_PREFIX/bin/kubectl completion zsh)
  complete -F __start_kubectl k
fi

if [[ -d "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/" ]]; then
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

[ -f "${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh" ] && . "${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh"

[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# [[ -f "${HOMEBREW_PREFIX}/bin/virtualenvwrapper_lazy.sh" ]] && source "${HOMEBREW_PREFIX}/bin/virtualenvwrapper_lazy.sh"

 eval "$(direnv hook zsh)"

eval "$(keychain --ignore-missing --quiet --eval ~/.ssh/personal_ed25519 ~/.ssh/personal_rsa ~/.ssh/ignota_engineering 2>/dev/null)"

eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --------------------------- asdf Version Manager --------------------------- #
[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && fpath=(${HOME}/.asdf/completions $fpath)
