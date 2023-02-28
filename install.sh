#!/usr/bin/env zsh

[[ ! -d $(brew --prefix) ]] && echo "homebrew is required" && exit 1
[[ ! -f $HOME/.zshrc.local ]] && echo "export path" > ~/.zshrc.local

if [[ ! -d $HOME/.zgenom ]]; then
  echo "Installing zgenom..."
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

if [[ ! -d $(brew --prefix asdf) ]]; then
  echo "Installing asdf..."
  brew install asdf
fi

if [[ ! -d $(brew --prefix starship) ]]; then
  echo "Installing starship..."
  brew install starship
fi

if [[ ! -d $(brew --prefix fzf) ]]; then
  echo "Installing fzf..."
  brew install fzf
fi

echo "Linking .zshrc..."
ln -snfh $PWD/zshrc $HOME/.zshrc
echo "Linking .zsh folder..."
[[ -d $HOME/.zsh && ! ($HOME/.zsh -ef $PWD/zsh) ]] && echo "Moving old .zsh folder to backup..." && mv $HOME/.zsh $HOME/zsh-bak
ln -snfh $PWD/zsh $HOME/.zsh
echo "Linking starship.toml..."
[[ ! -d $HOME/.config ]] && mkdir $HOME/.config
ln -snfh $PWD/starship.toml $HOME/.config/starship.toml

echo "... done. Reload your terminal or run 'source ~/.zshrc'"
