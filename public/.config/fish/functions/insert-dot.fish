function insert_dot
  # Get the text before the cursor
  set current_before_cursor (commandline -t)

  # Get the last two characters before the cursor
  set last_two (string sub -s -2 "$current_before_cursor")

  if test "$last_two" = ".."
    # If the last two characters are '..', insert '/..'
    commandline -i "/.."
  else
    # Otherwise, insert a single '.'
    commandline -i "."
  end
end

bind '.' insert_dot
