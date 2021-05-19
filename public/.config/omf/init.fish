if test -d /opt/homebrew
  set -x PATH /opt/homebrew/bin $PATH
end

if test -d /opt/local/share/macports
  set -x PATH /opt/local/bin $PATH
end
