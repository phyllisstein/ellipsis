function ls --wraps=gls
  /opt/homebrew/bin/gls --group-directories-first --human-readable --color=auto --quoting-style=literal $argv
end
