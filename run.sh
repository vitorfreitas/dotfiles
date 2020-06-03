create_symlinks()
{
  echo "Creating Symbolic Links"
  ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
  ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
  ln -s ~/dotfiles/nvim/plugins.vim ~/.config/nvim/plugins.vim
  ln -s ~/dotfiles/.zshrc ~/.zshrc
  ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
}

install_node()
{
  echo "Installing Node"
  curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
  bash n lts
}

install_oh_my_zsh()
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_programs()
{
  cd ~
  sudo pacman -Syu --noconfirm
  sudo pacman -Sy zsh git curl awk --noconfirm
  sudo pacman -Sy yay neovim docker docker-compose --noconfirm

  yay -Sy starship

  install_node
  install_oh_my_zsh
}

main()
{
  install_programs
  create_symlinks
}

main
