#!/usr/bin/env zsh

# -- Run BrowserStack on a locally-hosted address. -----------------------------
bsl() { BrowserStackLocal --key="$BROWSERSTACK_LOCAL_KEY" --force-local "$*"; }

# -- Create a new directory and cd into it. ------------------------------------
mkd() { mkdir -p "$@" && cd "$@"; }

# -- Google Dictionary! --------------------------------------------------------
#    FIXME: Not working.
# define() { local y="$*"; curl -sA "Opera" "http://www.google.com/search?q=define:${y// /+}" | LC_ALL=C ggrep -Po '(?<=<li>)[^<]+'|nl|perl -MHTML::Entities -pe 'decode_entities($_)' 2>/dev/null; }

# -- tar and gzip directories --------------------------------------------------
targz() {
  local tmpFile="${*%/}.tar"
  tar --acls --create --file="${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

  size=$(
    stat -f"%z" "${tmpFile}" 2>/dev/null # OS X `stat`
    stat -c"%s" "${tmpFile}" 2>/dev/null # GNU `stat`
  )

  local cmd=""
  if ((size < 52428800)) && hash zopfli 2>/dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli"
  else
    if hash pigz 2>/dev/null; then
      cmd="pigz"
    else
      cmd="gzip"
    fi
  fi

  echo "Compressing .tar using \`${cmd}\`…"
  "${cmd}" "${tmpFile}" || return 1
  [ -f "${tmpFile}" ] && rm "${tmpFile}"
  echo "${tmpFile}.gz created successfully."
}

# -- Determine size of a file or total size of a directory. --------------------
fs() {
  if du -b /dev/null >/dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* ./*
  fi
}

# -- Create a data URL from a file. --------------------------------------------
dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# -- Sublime little function. --------------------------------------------------
#    `s` with no arguments opens the current directory
#    in Sublime Text; otherwise opens the given location.
unalias s &>/dev/null
s() {
  if [[ $# -eq 0 ]]; then
    subl -n .
  else
    subl -n $*
  fi
}

c() {
  if [[ $# -eq 0 ]]; then
    code .
  else
    code $*
  fi
}

unalias e &>/dev/null
e() {
  if [[ $# -eq 0 ]]; then
    $VISUAL .
  else
    $VISUAL $*
  fi
}

# -- Open Sesame! --------------------------------------------------------------
#    `o` with no arguments opens current directory, otherwise
#    opens the given location
unalias o &>/dev/null
o() {
  if [[ $# -eq 0 ]]; then
    open .
  else
    open "$@"
  fi
}

# -- Trees are tops. -----------------------------------------------------------
#    `tre` is a shorthand for `tree` with hidden files and
#    color enabled, ignoring the `.git` directory, listing
#    directories first. The output gets piped into
#    `less` with options to preserve color and line numbers,
#    unless the output is small enough for one screen.
tre() {
  if [[ $# -eq 0 ]]; then
    tree -aC -I '.git|node_modules|bower_components|tmp|log' --dirsfirst .
  else
    tree -aC -I '.git|node_modules|bower_components|tmp|log' --dirsfirst "$@"
  fi
}

# -- Pretty-print and highlight JSON. ------------------------------------------
json() {
  if [ -t 0 ]; then # argument
    python -mjson.tool <<<"$*" | pygmentize -l javascript
  else # pipe
    python -mjson.tool | pygmentize -l javascript
  fi
}

# -- Touch a file, creating all intermediary directories. ----------------------
shove() {
  mkdir -p "$(dirname "$@")"
  touch "$@"
}

# -- Clobber the ole node_modules. ---------------------------------------------
smokebreak() {
  if [[ -e package-lock.json ]]; then
    rm -rf node_modules package-lock.json
    npm i
  elif [[ -e yarn.lock ]]; then
    rm -rf node_modules yarn.lock
    yarn
  fi
}

# -- Git 'er done. -------------------------------------------------------------
#    Download a subdirectory of a Git repo.
#    FIXME: Not working.
# gdl() {
#   local to="${1(##"https://github.com/*/tree/master")(/\//-)}"
#   svn export "${1/tree\/master/trunk}" "${2:-}"
# }

# -- Render a GitHub repo's README as a PDF. -----------------------------------
#    FIXME: Not working.
# git-down() {
#   http https://api.github.com Accept:application/vnd.github.v3+json "Authorization:token $GITHUB_API_TOKEN"
# }

# -- Refresh Gatsby. -----------------------------------------------------------
gatlin() {
  local target=${GATSBY_URL:-$1}
  http POST ${target}/__refresh
}

# -- Debug in Chrome. ----------------------------------------------------------
chrome-debug() {
  nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 &>/dev/null &
}

canary-debug() {
  nohup /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222 &>/dev/null &
}

simulator-debug() {
  nohup $SIM_APP -SimulateApplication $SDK_DIR/iPhoneSimulator.sdk/Applications/MobileSafari.app/MobileSafari &>/dev/null &
  nohup ios_webkit_debug_proxy &>/dev/null &
}

# -- Search history. -----------------------------------------------------------
unalias h &>/dev/null
h() {
  history 1 | ggrep --ignore-case --color=auto "$*"
}

# -- Make a cert. --------------------------------------------------------------
crt() {
  mkcert -ecdsa "${@}" "*.${@}" "localhost" "127.0.0.1" "::1"
  fd '\+\d.*?\.pem$' . | rename --subst '-key.pem' '.key' --subst '.pem' '.crt' --expr 's/\+\d+\.(crt|key)\z/.$1/'
}

# -- Quiet Yarn. ---------------------------------------------------------------
yarn-quiet() {
  local log_path="$HOME/Library/Logs/Yarn/$(basename "$PWD")/$(date +%F-%H%M.%S).log"

  [[ -d "$(dirname "$log_path")" ]] || mkdir -p "$(dirname "$log_path")"

  $HOMEBREW_PREFIX/bin/yarn $* 2>"${log_path}"

  local ret="$?"

  if [[ "$ret" != "0" ]]; then
    cat "$log_path"
  fi

  return $ret
}

# -- Learn you a kube. ---------------------------------------------------------
kubectl() {
  echo "+ kubectl $@" >&2
  command kubectl $@
}

# -- Is Docker av-whale-able? --------------------------------------------------
# docker() {
#   if ! pgrep Docker &>/dev/null; then
#     open -j /Applications/Docker.app

#     while ! docker info &>/dev/null; do
#       sleep 1
#     done
#   fi

#   /usr/local/bin/docker $*
# }

# -- Ignore me. ----------------------------------------------------------------
gi() {
  curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/list" \
    | sed -E 's|,|\n|g' \
    | fzf -m \
    | tr '\n' ',' \
    | xargs -I{} curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/{}"
}
