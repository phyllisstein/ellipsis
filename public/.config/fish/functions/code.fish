function code
  if string match -r -q '^vscode$' $VSCODE_BIN
    set -gx EDITOR='code -w'
  else if string match -r -q '^vscode-insiders$' $VSCODE_BIN
    set -gx EDITOR='code-insiders -w'
  end
end
