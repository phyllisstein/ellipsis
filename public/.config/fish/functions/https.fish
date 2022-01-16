function https --wraps=http
  http --default-scheme=https $argv
end
