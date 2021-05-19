function pfd
  echo "
    tell application \"Finder\"
      return POSIX path of (target of first window as text)
    end tell
  " | osascript
end
