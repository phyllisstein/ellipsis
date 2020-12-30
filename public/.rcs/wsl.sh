# --------------------------------- Homebrew --------------------------------- #
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

# ---------------------------------- mkcert ---------------------------------- #
export CAROOT="/c/Users/danie/Dropbox/Settings/SSL"
export NODE_EXTRA_CA_CERTS="$CAROOT/rootCA.pem"
