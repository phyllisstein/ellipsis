function shove --argument-names=file
  mkdir -p (dirname "$file")
  touch "$file"
end
