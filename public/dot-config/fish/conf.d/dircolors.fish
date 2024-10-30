if test -e ~/.dircolors
  eval (gdircolors -c ~/.dircolors/phyllisstein | sed 's|setenv|set -gx|')
end
