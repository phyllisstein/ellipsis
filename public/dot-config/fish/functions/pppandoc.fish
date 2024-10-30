function pppandoc --wraps pandoc
  set -l pandoc_args ""
  set -l input_name ""

  for arg in $argv
    if string match --regex --quiet -- '^-' $arg
      set pandoc_args pandoc_args $arg
    else
      set input_name $arg
    end
  end

  if test -z $input_name
    echo "No input file specified"
    return 1
  end

  set -l output_name (string replace --regex -- '.(md|markdown|mdown)$' '.html' $input_name)
  set -l output_path (dirname $output_name)

  echo $pandoc_args

  /Users/daniel/.local/bin/pp $input_name \
    | /opt/homebrew/bin/pandoc  \
        --template=grip.html \
        --from=markdown+emoji+yaml_metadata_block+bracketed_spans+startnum+task_lists+example_lists+superscript+subscript \
        --to=html5 \
        --filter=/Users/daniel/Code/Personal/pandoc-assets/filters/pygmentize.py \
        --output="$output_path/$output_name" \
        $input_name
end
