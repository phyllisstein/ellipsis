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

# -- Load breakaway config files. -----------------------------
for dot in $HOME/.rcs/{secrets,options,environment,aliases,functions}.sh; do
  test -f "$dot" && source "$dot"
done

# Load help files for Brewed ZSH.
unalias run-help
autoload run-help
export HELPDIR="/usr/local/share/zsh/helpfiles:$HELPDIR"

[[ -r "$HOMEBREW_PREFIX/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/profile.d/bash_completion.sh"

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# [[ -f /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh ]] && source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# [[ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

[[ -f "${HOME}/.kubectl_aliases" ]] && source "${HOME}/.kubectl_aliases"
source <(/usr/local/bin/kubectl completion zsh)
complete -F __start_kubectl k

eval "$(gdircolors -b "$HOME/.dircolors/phyllisstein")"

if [[ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# export NVM_DIR="/usr/local/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# [[ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]] && source /usr/local/bin/virtualenvwrapper_lazy.sh

# eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

eval "$(keychain --ignore-missing --quiet --eval ~/.ssh/personal_ed25519 ~/.ssh/personal_rsa)"

eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
