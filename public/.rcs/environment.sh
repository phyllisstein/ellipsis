#!/usr/bin/env zsh

# -- General shell configuration. ----------------------------------------------
export BANG_HIST=true
export EDITOR="/usr/local/bin/code-insiders --wait --reuse-window"
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

# -- Compilation flags. --------------------------------------------------------
export BUNDLE_JOBS=8
export BUNDLE_IGNORE_CONFIG=1

# -- Application-related exports... --------------------------------------------

# ...for Homebrew.
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_MAKE_JOBS=2
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_FORCE_BREWED_GIT=1

# ...for GraalVM.
export CORRETTO_11_JAVA_HOME="/Users/daniel/.asdf/installs/java/corretto-11.0.9.11.1"
export CORRETTO_8_JAVA_HOME="/Users/daniel/.asdf/installs/java/corretto-8.275.01.1"
export GRAAL_JAVA_HOME="/Library/Java/VirtualMachines/graalvm-ee-java11-20.2.0/Contents/Home"
export GRAAL_PATH="/Library/Java/VirtualMachines/graalvm-ee-java11-20.2.0/Contents/Home/bin"
export JAVA_HOME="$GRAAL_JAVA_HOME"
export PATH="$GRAAL_PATH:$PATH"

# ...for Python.
export WORKON_HOME="$HOME/.local/share/virtualenvs"
export PROJECT_HOME="$HOME/Code"

if ! hash conda &>/dev/null; then
  export PATH="/usr/local/opt/python@3.7/libexec/bin:$PATH"
fi

# ...for Node.
# export NODE_OPTIONS="--experimental-modules --experimental-vm-modules --experimental-repl-await --es-module-specifier-resolution=node"
# export NODE_OPTIONS="--no-deprecation"
export NODEJS_CHECK_SIGNATURES=no
export PATH="$PATH:/usr/local/yarn/node_modules/.bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
# export NODE_REPL_HISTORY=~/.node_history
# export NODE_REPL_HISTORY_SIZE=32768
# export NODE_REPL_MODE=sloppy

# ...for Sublime Text.
# export PYTHONPATH="$PYTHONPATH:/Applications/Sublime Text.app/Contents/MacOS"

# ...for awscli.
export AWS_PROFILE=ignota

#  ...for GitHub's `hub`.
export GITHUB_USERNAME="phyllisstein"

# ...for asdf.
export PATH="$HOME/.asdf/shims:$PATH"

# ...for Pandoc filters.
export PATH="$PATH:$HOME/.pandoc/filters"

# ...for Go.
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

# ...for ios-webkit-debug-proxy.
export SDK_DIR="/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/"
export SIM_APP="/Applications/Xcode-beta.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator"

# ...for Docker.
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

# ... for Neovim.
export VIMCONFIG="$HOME/.config/nvim"
export VIMDATA="$HOME/.local/share/nvim"

# ... for FZF.
export FZF_DEFAULT_COMMAND='fd --follow --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

# ... for Overcommit.
# export GIT_TEMPLATE_DIR="$(overcommit --template-dir)"

# ... for Vagrant.
export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
export VAGRANT_INSTALL_LOCAL_PLUGINS=true
export VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1

# ... for Pandoc/pp.
export PP_MACROS_PATH=$HOME/.pandoc/goodies/pp/macros
export PATH="$HOME/.local/bin:$PATH"

# ... for Python pipenv.
# export PIPENV_IGNORE_VIRTUALENVS=1
export PIPENV_VERBOSITY=-1

# ... for custom font scripts.
export PATH="$PATH:$HOME/Dropbox/Documents/Fonts"

# ... for krew.
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# ... for Neo4j.
export PATH="$PATH:/usr/local/opt/neo4j/4.1.2/bin"

# ... for GNU coreutils.
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:$PATH"

# ... for mkcert.
export CAROOT="$HOME/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"

# ... for Ruby.
# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/rvm/bin:$PATH"
# export RUBY_CONFIGURE_OPTS="--sysconfdir=/usr/local/etc --with-openssl-dir=/usr/local/opt/openssl --with-opt-dir=/usr/local:/usr/local/opt/openssl:/usr/local/opt/readline:/usr/local/opt/gperftools --with-readline-dir=/usr/local/opt/readline"

# ... for Android Studio.
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/build-tools/29.0.2:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools"

# ... for Git.
export GIT_EDITOR="$EDITOR"
export GIT_MERGE_AUTOEDIT=no

# ... for Gatsby.
export GATSBY_GRAPHQL_IDE=playground
export ENABLE_REFRESH_ENDPOINT=true

# ... for Rust.
export PATH="$PATH:$HOME/.cargo/bin"
export CLIPPY_DISABLE_DOCS_LINKS=true

# ... for GPG.
export GPG_TTY="$(tty)"

# ... for cURL.
export PATH="/usr/local/opt/curl/bin:$PATH"

# ... for Vagrant VMWare integration.
export PATH="$PATH:/opt/vagrant-vmware-desktop/bin"

# ... for Google Cloud SDK.
export CLOUDSDK_PYTHON=/usr/local/opt/python@3.7/libexec/bin/python
export PATH="$PATH:/usr/local/opt/google-cloud-sdk/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
