function c --wraps=code
  if test (count $argv) -eq 0
    $VSCODE_BIN --new-window (pwd)
    return
  end

  set path $argv[-1]
  set params $argv[1..-2]

  if test -d $path; or test (count (string match --regex new-window "$argv")) -gt 0
    $VSCODE_BIN --new-window $params $path
    return
  end

  $VSCODE_BIN --reuse-window $params $path
end
