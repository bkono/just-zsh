#!/usr/bin/env zsh

[[ ! -d $(brew --prefix) ]] && echo "homebrew is required" && exit 1
[[ ! -f $HOME/.zshrc.local ]] && echo "export path" > ~/.zshrc.local

function brew_install() {
  if [[ ! -d $(brew --prefix $1) ]]; then
    echo "Installing $1..."
    brew install $1
  fi
}

if [[ ! -d $HOME/.zgenom ]]; then
  echo "Installing zgenom..."
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

# install the things
prereqs=('asdf' 'starship' 'fzf' 'bat' 'gh')
for prereq in $prereqs; do
  brew_install $prereq
done

# link the things
echo "Linking .zshrc..."
ln -snfh $PWD/zshrc $HOME/.zshrc

echo "Linking .zsh folder..."
[[ -d $HOME/.zsh && ! ($HOME/.zsh -ef $PWD/zsh) ]] && echo "Moving old .zsh folder to backup..." && mv $HOME/.zsh $HOME/zsh-bak
ln -snfh $PWD/zsh $HOME/.zsh

echo "Linking starship.toml..."
[[ ! -d $HOME/.config ]] && mkdir $HOME/.config
ln -snfh $PWD/starship.toml $HOME/.config/starship.toml

echo "... done. Reload your terminal or run 'source ~/.zshrc'"
