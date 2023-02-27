# vim: fdm=marker sw=2 ts=2 sts=2 tw=80 nofoldenable

# load zgenom
source "$HOME/.zgenom/zgenom.zsh"
export EDITOR='nvim'
export VEDITOR='code'

export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)

# check for updates every 7 days
zgenom autoupdate

if ! zgenom saved; then
  echo "Creating zgenom save state..."

  zgenom compdef

  #
  # extensions
  zgenom load jandamm/zgenom-ext-release

  zgenom ohmyzsh
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/sudo
  zgenom ohmyzsh --completion plugins/docker-compose
  [[ "$(uname -s)" = Darwin ]] && zgenom ohmyzsh plugins/macos


  # this is breaking things, need alternatives
  # zgenom prezto
  # zgenom prezto gpg
  # # Load prezto tmux when tmux is installed
  # if hash tmux &>/dev/null; then
  #   zgenom prezto tmux
  # fi

  zgenom load djui/alias-tips
  zgenom load hlissner/zsh-autopair
  zgenom load rupa/z

  # releases
  zgenom release junegunn/fzf --pattern '*darwin_arm64*'
  zgenom load junegunn/fzf shell
  # zgenom load ubainvaes/fzf-marks
  zgenom load "$HOME/.zsh"

  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-completions

  [[ -x $(whence -cp upterm) ]] && upterm completion zsh > $(brew --prefix)/share/zsh/site-functions/_upterm

  # zgenom ohmyzsh themes/arrow
  # zgenom load mafredri/zsh-async
  # zgenom load sindresorhus/pure

  [[ -d $(brew --prefix)/share/zsh/site-functions ]] && zgenom load --completion $(brew --prefix)/share/zsh/site-functions

  zgenom save

# Compile zsh files
  zgenom compile "$HOME/.zshrc"

  echo "...done"
fi

[ -d $HOME/.zgenom/bin ] && path=(~/.zgenom/bin $path)
[ -d $(brew --prefix)/bin ] && path=($(brew --prefix)/bin $path)
[ -d $(brew --prefix llvm) ] && path=($(brew --prefix llvm)/bin $path)
[ -d /Applications/Postgres.app/Contents/Versions/latest/bin ] && path=(/Applications/Postgres.app/Contents/Versions/latest/bin $path)
[ -d ~/.local ] && path=(~/.local/bin $path)
[[ -f $(brew --prefix asdf)/libexec/asdf.sh ]] && source $(brew --prefix asdf)/libexec/asdf.sh

eval "$(starship init zsh)"

# default editors
if [ -e "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

