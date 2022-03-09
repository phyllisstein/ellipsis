set -gx NODE_VERSIONS "$HOME/.asdf/installs/nodejs"
set -gx NODE_VERSION_PREFIX ""
eval (asdf exec direnv hook fish)
