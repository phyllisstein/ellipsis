# function retweet --description "Restore access to Twitter by commenting out its hosts entry in /etc/hosts"
#   sudo gsed --regexp-extended --in-place 's/^.*twitter/# \0/' /etc/hosts
# end

# sudo gsed --regexp-extended --in-place 's/^#[[:blank:]]+?([.\d]+.*twitter)/\1/' /etc/hosts
