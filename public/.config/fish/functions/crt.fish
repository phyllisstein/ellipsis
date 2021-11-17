function crt
    mkcert -ecdsa \
        $argv \
        (string join '' "*." $argv) \
        localhost \
        "127.0.0.1" \
        "::1"

    fd '\+\d.*?\.pem' . | rename --subst "-key.pem" ".key" --subst ".pem" ".crt" --expr 's/\+\d+\.(crt|key)\z/.$1/'
end
