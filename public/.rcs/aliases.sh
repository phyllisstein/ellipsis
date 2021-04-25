# -- Calm down. ----------------------------------------------------------------
unalias rm &>/dev/null
unalias cp &>/dev/null
unalias mv &>/dev/null

# -- Obviously. ----------------------------------------------------------------
alias -- -="cd -"
alias ~="cd ~"
alias a='arch -x86_64'
alias apm='apm-beta'
alias atom='atom-beta'
alias b='brew'
alias ib='arch -x86_64 /usr/local/bin/brew'
alias bups='brew update && brew upgrade'
# alias code='code-insiders'
# alias cpan='rlwrap cpan'
alias du='du -mhs --apparent-size'
alias f='cdf'
# alias find='noglob find -E'
alias ghostscript="$HOMEBREW_PREFIX/bin/gs"
alias git='hub'
compdef hub='git'
alias gsu='git standup'
alias https='http --default-scheme=https'
alias iex='rlwrap iex'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias n='npm'
alias npc='npm-check'
alias pack-on='yarn start:dev &> /dev/null &'
alias pack-off='pkill webpack'
alias pcr='passenger-config restart-app .'
alias pcR='rm yarn.lock; rm -rf node_modules; yarn; passenger-config restart-app .'
alias repath='sudo launchctl config user path "$PATH" && sudo launchctl config system path "$PATH"'
# alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias urlencode='python -c "import sys; from urllib import parse as p; f = open(sys.argv[1], mode=''rb''); print(p.quote_plus(f.read())); f.close();"'
# alias yarn='yarn-quiet'
alias y='yarn'
alias ydl='youtube-dl --format="bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --hls-prefer-ffmpeg --merge-output=mp4 --no-mtime --no-overwrites --no-warnings --output="%(title)s.%(ext)s" --playlist-random --restrict-filenames --user-agent="Mozilla/5.0"'

# -- Handy network tricks. -----------------------------------------------------
# alias myip='dig @resolver1.opendns.com -4 myip.opendns.com +short && dig +short -6 myip.opendns.com aaaa @resolver1.ipv6-sandbox.opendns.com'
alias myip='dig @resolver1.opendns.com -4 myip.opendns.com +short'
alias flush='sudo killall -HUP mDNSResponder && sudo dscacheutil -flushcache && lunchy restart dnsmasq'

# -- Empty the trash on all mounted volumes ------------------------------------
alias emptytrash='sudo rm -rf /Volumes/*/.Trashes; sudo rm -rf ~/.Trash; sudo rm -rf /private/var/log/asl/*.asl'

# -- Pretty directory listings. ------------------------------------------------
#    Defaults to the `gls` command installed with GNU Coreutils (`brew install coreutils`).
alias ls="$HOMEBREW_PREFIX/bin/gls --group-directories-first --human-readable --color=auto --quoting-style=literal"

# -- Trim newlines and copy. ---------------------------------------------------
alias ccp="tr -d '\n' | pbcopy"

# -- grep on 'roids. -----------------------------------------------------------
#    Assumes GNU grep (`brew install grep`).
alias gg='ggrep --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --line-number --context=3 --ignore-case --color=auto'

# -- Secrets! ------------------------------------------------------------------
alias topdesk='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias desktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# -- GET the thing. POST haste. ------------------------------------------------
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "${method}"="http ${method}"
done
