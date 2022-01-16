# function detweet --description="Block Twitter by removing the comment from its hosts file entry"
#   sudo gsed --regexp-extended --in-place 's/^#[[:blank:]]+?([.\d]+.*twitter)/\1/' /etc/hosts
# end
# sudo gsed --regexp-extended 's/^#[[:blank:]]+?(.*twitter)/\1/' /etc/hosts
# sudo gsed --regexp-extended 's/^.*twitter/# \0/' /etc/hosts
