if brew list | grep gnu &> /dev/null
    set -x PATH \
        /usr/local/opt/coreutils/libexec/gnubin \
        /usr/local/opt/findutils/libexec/gnubin \
        /usr/local/opt/gawk/bin \
        /usr/local/opt/gnu-indent/libexec/gnubin \
        /usr/local/opt/gnu-sed/libexec/gnubin \
        /usr/local/opt/gnu-tar/libexec/gnubin \
        /usr/local/opt/gnu-which/libexec/gnubin \
        /usr/local/opt/grep/libexec/gnubin \
        /usr/local/opt/gsed/libexec/gnubin \
        /usr/local/opt/make/libexec/gnubin \
        $PATH
end
