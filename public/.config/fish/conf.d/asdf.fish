# Source asdf.
if test -e /opt/homebrew/opt/asdf
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
else if test -e "$HOME/.asdf"
  source "$HOME/.asdf/asdf.fish"
end
