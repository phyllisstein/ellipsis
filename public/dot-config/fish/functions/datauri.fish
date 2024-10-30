function datauri
  set mime_type (file -b --mime-type $argv)

  if string match --regex '^text/'
    set mime_type "$mime_type;charset=utf-8"
  end

  set base64_data (openssl base64 -in $argv | tr -d '\n')
  set data_uri "data:$mime_type;base64,$base64_data"
  echo -n "$data_uri" | pbcopy
end
