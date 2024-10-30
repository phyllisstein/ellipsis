if brew list | grep gnu &> /dev/null
  set -gx PATH \
    /opt/homebrew/opt/coreutils/libexec/gnubin \
    /opt/homebrew/opt/findutils/libexec/gnubin \
    /opt/homebrew/opt/gawk/bin \
    /opt/homebrew/opt/gnu-indent/libexec/gnubin \
    /opt/homebrew/opt/gnu-sed/libexec/gnubin \
    /opt/homebrew/opt/gnu-tar/libexec/gnubin \
    /opt/homebrew/opt/gnu-which/libexec/gnubin \
    /opt/homebrew/opt/grep/libexec/gnubin \
    /opt/homebrew/opt/gsed/libexec/gnubin \
    /opt/homebrew/opt/make/libexec/gnubin \
    $PATH
end
