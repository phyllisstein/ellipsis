function c
  if test (count $argv) -eq 0
    code-insiders --new-window (pwd)
    return
  end

  set path $argv[-1]
  set params $argv[1..-2]

  if test -d $path; or test (count (string match --regex new-window "$argv")) -gt 0
    code-insiders --new-window $params $path
    return
  end

  code-insiders $params $path
end
