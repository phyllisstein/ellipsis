# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

function asdf_update_java_home
    set --local java_path (asdf which java)
    if test -n "$java_path"
        set --local full_path (builtin realpath "$java_path")

        # `builtin realpath` returns $JAVA_HOME/bin/java, so we need two `dirname` calls
        # in order to get the correct JAVA_HOME directory
        set -gx JAVA_HOME (dirname (dirname "$full_path"))
        set -gx JDK_HOME "$JAVA_HOME"
    end
end

function __asdf_update_java_home_on_cd --on-variable PWD
    asdf_update_java_home
end
