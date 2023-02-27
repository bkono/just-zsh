CUR=$(dirname $0)

alias abu="antibody bundle <\"$CUR/bundles.txt\" > $HOME/.zsh_plugins.sh && antibody update && source $HOME/.zshrc"
