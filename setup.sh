cd ~

# do symlinks
~/dotfiles/makesymlinks.sh

############################################
#      setting up a linux box
#############################################

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



#nvim
echo 'setting up neovim..'
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

# tell nvim where to look for config
chmod u+x nvim.appimage
mkdir ~/.config
mkdir ~/.config/nvim/
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after \nlet &packpath = &runtimepath\nsource ~/.vimrc' > ~/.config/nvim/init.vim

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
sed -e "\$aZSH_THEME=\"terminalparty\"" ~/.zshrc


#Nextcloud
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt-get update
sudo apt-get install nextcloud-client
# remember to open nextcloud through the GUI to get it running in the
# background


#Python (Anaconda distribution)
cd ~
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
chmod +x Anaconada3-5.1.0-Linux-x86_64.sh
./Anaconada3-5.1.0-Linux-x86_64.sh
