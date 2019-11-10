cd ~

# do symlinks
~/dotfiles/makesymlinks.sh

############################################
#      setting up a linux box
#############################################

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# add fish like plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#nvim
echo 'setting up neovim..'
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

# tell nvim where to look for config
chmod u+x nvim.appimage
mkdir ~/.config
mkdir ~/.config/nvim/
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after \nlet &packpath = &runtimepath\nsource ~/.vimrc' > ~/.config/nvim/init.vim

# for python support
pip install neovim

# vundle for git
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/colors
wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
cd


# edit zshrc
sed -e "\$aalias nvim=\'~/.nvim.appimage\'" ~/.zshrc
sed -e "\$aalias cl=\'clear\'" ~/.zshrc

