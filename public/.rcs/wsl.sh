# --------------------------------- Homebrew --------------------------------- #
if hash brew &> /dev/null; then
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

    unalias run-help
    export HELPDIR="$HOMEBREW_PREFIX/share/zsh/helpfiles:$HELPDIR"
fi

# ----------------------------- ZSH Documentation ---------------------------- #
autoload run-help

# ---------------------------------- mkcert ---------------------------------- #
export CAROOT="/mnt/c/Users/danie/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"

# ------------------------------------ X11 ----------------------------------- #
wsl_ip_line=$(ipconfig.exe | grep "WSL" -n | awk -F ":" '{print $1+4}')
export DISPLAY=$(ipconfig.exe | awk -v a=$wsl_ip_line '{if (NR==a) print $NF":0.0"}' | tr -d "\r")
export LIBGL_ALWAYS_INDIRECT=1
export QT_SCALE_FACTOR=2
export GDK_SCALE=2

# --------------------------------- dircolors -------------------------------- #
eval "$(dircolors -b "$HOME/.dircolors/phyllisstein")"
