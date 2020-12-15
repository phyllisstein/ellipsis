#!/usr/bin/env zsh

# ============================================================================ #
# ========================== General Shell Settings ========================== #
# ============================================================================ #
export BANG_HIST=true
export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export EXTENDED_HISTORY=true
export HIST_IGNORE_DUPS=true
export HISTSIZE=32768
export HISTFILESIZE="$HISTSIZE"
export HISTCONTROL=ignoreboth
export HISTIGNORE="*ydl*:*youtube-dl*"
export SAVEHIST=32768
export SHARE_HISTORY=false
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PROMPT_EOL_MARK=''
export SAVEHIST=32768
export SHARE_HISTORY=false
export LC_ALL=en_US.UTF-8

# ---------------------------------- VSCode ---------------------------------- #
export EDITOR="$(which code) --wait --reuse-window"


# ============================================================================ #
# ========================== Application Environment ========================= #
# ============================================================================ #

# --------------------------------- Homebrew --------------------------------- #
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_MAKE_JOBS=2
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_FORCE_BREWED_GIT=1

# ----------------------------------- Java ----------------------------------- #
export CORRETTO_11_JAVA_HOME="/Users/daniel/.asdf/installs/java/corretto-11.0.9.11.1"
export CORRETTO_8_JAVA_HOME="/Users/daniel/.asdf/installs/java/corretto-8.275.01.1"
export JAVA_HOME="$GRAAL_JAVA_HOME"
export PATH="$GRAAL_PATH:$PATH"

# ---------------------------------- Python ---------------------------------- #
export WORKON_HOME="$HOME/.local/share/virtualenvs"
export PROJECT_HOME="$HOME/Code"
# export PIPENV_IGNORE_VIRTUALENVS=1
export PIPENV_VERBOSITY=-1

# ---------------------------------- NodeJS ---------------------------------- #
# export NODE_OPTIONS="--experimental-modules --experimental-vm-modules --experimental-repl-await --es-module-specifier-resolution=node"
# export NODE_OPTIONS="--no-deprecation"
export NODEJS_CHECK_SIGNATURES=no
export PATH="$PATH:/usr/local/yarn/node_modules/.bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
# export NODE_REPL_HISTORY=~/.node_history
# export NODE_REPL_HISTORY_SIZE=32768
# export NODE_REPL_MODE=sloppy

# ------------------------------- Sublime Text ------------------------------- #
# export PYTHONPATH="$PYTHONPATH:/Applications/Sublime Text.app/Contents/MacOS"

# ---------------------------------- AWS CLI --------------------------------- #
export AWS_PROFILE=ignota

# ------------------------------------ hub ----------------------------------- #
export GITHUB_USERNAME="phyllisstein"

# ----------------------------------- asdf ----------------------------------- #
export PATH="$HOME/.asdf/shims:$PATH"

# ------------------------------ Pandoc Filters ------------------------------ #
export PATH="$PATH:$HOME/.pandoc/filters"

# ------------------------------------ Go ------------------------------------ #
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

# ------------------------------- GNU Coreutils ------------------------------ #
export PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-which/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gsed/libexec/gnubin:${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-indent/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${HOMEBREW_PREFIX}/opt/make/libexec/gnubin:${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin:$PATH"

# -------------------------- ios-webkit-debug-proxy -------------------------- #
export SDK_DIR="/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/"
export SIM_APP="/Applications/Xcode-beta.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator"

# ---------------------------------- Docker ---------------------------------- #
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.83.128:2376"
# export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/default"
# export DOCKER_MACHINE_NAME="default"
# export MACHINE_NATIVE_SSH=true
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
export MINIKUBE_WANTUPDATENOTIFICATION=0
export MINIKUBE_VM_DRIVER=parallels
export MINIKUBE_CPUS=4
export MINIKUBE_MEMORY=4096
export MINIKUBE_DISK_SIZE=64g
export MINIKUBE_ENABLE_DEFAULT_CNI=true
export MINIKUBE_NETWORK_PLUGIN=cni
export PARALLELS_CPU_COUNT=4
export PARALLELS_DISK_SIZE=65536
export PARALLELS_MEMORY_SIZE=4096
export PARALLELS_VIDEO_SIZE=256

# ---------------------------------- Neovim ---------------------------------- #
export VIMCONFIG="$HOME/.config/nvim"
export VIMDATA="$HOME/.local/share/nvim"

# ------------------------------------ fzf ----------------------------------- #
export FZF_DEFAULT_COMMAND='fd --follow --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

# ---------------------------------- Vagrant --------------------------------- #
export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
export VAGRANT_INSTALL_LOCAL_PLUGINS=true
export VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1

# ---------------------------------- Pandoc ---------------------------------- #
export PP_MACROS_PATH="$HOME/.local/share/pandoc/goodies/pp/macros"
export PATH="$HOME/.local/bin:$PATH"

# ------------------------------- Font Scripts ------------------------------- #
if [[ "$ELLIPSIS_PLATFORM" == "macos" ]]; then
  export PATH="$PATH:$HOME/Dropbox/Documents/Fonts"
elif [[ "$ELLIPSIS_PLATFORM" == "wsl" ]]; then
  export PATH="$PATH:/mnt/c/Dropbox/Documents/Fonts"
fi

# ------------------------------ Kubernetes Krew ----------------------------- #
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# ... for mkcert.
export CAROOT="$HOME/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"

# ----------------------------------- Ruby ----------------------------------- #
if [[ -d "$HOME/.rvm" ]]; then
  __rvm_path="$HOME/.rvm"
elif [[ -d /usr/local/rvm ]]; then
  __rvm_path=/usr/local/rvm
fi
export PATH="$PATH:${__rvm_path}/bin"
[[ -s "${__rvm_path}/scripts/rvm" ]] && source "${__rvm_path}/scripts/rvm"

export BUNDLE_JOBS=8
export BUNDLE_IGNORE_CONFIG=1

# ------------------------------ Android Studio ------------------------------ #
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/build-tools/29.0.2:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools"

# ------------------------------------ Git ----------------------------------- #
export GIT_EDITOR="$EDITOR"
export GIT_MERGE_AUTOEDIT=no

# ---------------------------------- Gatsby ---------------------------------- #
export GATSBY_GRAPHQL_IDE=playground
export ENABLE_REFRESH_ENDPOINT=true

# ----------------------------------- Rust ----------------------------------- #
export PATH="$PATH:$HOME/.cargo/bin"
export CLIPPY_DISABLE_DOCS_LINKS=true

# ------------------------------------ GPG ----------------------------------- #
export GPG_TTY="$(tty)"

# ----------------------------------- cURL ----------------------------------- #
export PATH="${HOMEBREW_PREFIX}/curl/bin:$PATH"

# ------------------------------ Vagrant VMWare ------------------------------ #
export PATH="$PATH:/opt/vagrant-vmware-desktop/bin"

# ----------------------------- Google Cloud SDK ----------------------------- #
export CLOUDSDK_PYTHON="${HOMEBREW_PREFIX}/python@3.8/libexec/bin/python"
