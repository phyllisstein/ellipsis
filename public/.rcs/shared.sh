#!/usr/bin/env zsh

autoload -U regexp-replace
autoload -U zmv
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -Ls'

[[ -d "$HOME/.asdf" ]] && source "$HOME/.asdf/asdf.sh"

# if hash conda 2>/dev/null; then
#   # >>> conda initialize >>>
#   # !! Contents within this block are managed by 'conda init' !!
#   __install_path="$(asdf where python)"
#   __conda_setup="$("${__install_path}/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
#   if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
#   else
#     if [ -f "${__install_path}/etc/profile.d/conda.sh" ]; then
#       . "${__install_path}/etc/profile.d/conda.sh"
#     else
#       export PATH="$PATH:${__install_path}/bin"
#     fi
#   fi
#   unset __conda_setup
#   # <<< conda initialize <<<

#   conda activate global
# fi

# -------------------------- Breakaway Config Files -------------------------- #
if [[ "$ELLIPSIS_PLATFORM" == "macos" ]]; then
  test -f "$HOME/.rcs/macos.sh" && source "$HOME/.rcs/macos.sh"
elif [[ "$ELLIPSIS_PLATFORM" == "wsl"]]; then
  test -f "$HOME/.rcs/wsl.sh" && source "$HOME/.rcs/wsl.sh"
fi

for dot in $HOME/.rcs/{secrets,options,environment,aliases,functions}.sh; do
  test -f "$dot" && source "$dot"
done

# ----------------------------- Homebrew ZSH Help ---------------------------- #
unalias run-help
autoload run-help
export HELPDIR="$HOMEBREW_PREFIX/share/zsh/helpfiles:$HELPDIR"

# ------------------------------ Shell Utilities ----------------------------- #
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# [[ -f "${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh" ]] && source "${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh"

# [[ -f "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# [[ -f "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# [[ -f "${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

[[ -f "${HOME}/.kubectl_aliases" ]] && source "${HOME}/.kubectl_aliases"
source <($HOMEBREW_PREFIX/bin/kubectl completion zsh)
complete -F __start_kubectl k

eval "$(gdircolors -b "$HOME/.dircolors/phyllisstein")"

if [[ -d "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/" ]]; then
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

[ -f "${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh" ] && . "${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh"

# [[ -f "${HOMEBREW_PREFIX}/bin/virtualenvwrapper_lazy.sh" ]] && source "${HOMEBREW_PREFIX}/bin/virtualenvwrapper_lazy.sh"

# eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

eval "$(keychain --ignore-missing --quiet --eval ~/.ssh/personal_ed25519 ~/.ssh/personal_rsa)"

eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
