function n
    if test (count $argv) -eq 0
        nvim .
        return
    end

    set path $argv[-1]
    set params $argv[1..-2]

    nvim $params $path
end
