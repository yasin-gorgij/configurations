#!/bin/zsh
set -ex

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y ca-certificates curl emacs ffmpeg fonts-cantarell fonts-firacode gnupg imagemagick libpng-dev libpoppler-glib-dev lsb-release vim vlc zlib1g-dev 

# Install ASDF #
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.0
echo '' >> $HOME/.zshrc
echo '# ASDF #' >> $HOME/.zshrc
echo '. $HOME/.asdf/asdf.sh' >> $HOME/.zshrc
source $HOME/.asdf/asdf.sh

# Install Erlang and Elixir #
sudo apt-get install -y autoconf build-essential fop libgl1-mesa-dev libglu1-mesa-dev libncurses5-dev libncurses-dev libpng-dev libssh-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libxml2-utils m4 openjdk-11-jdk unixodbc-dev unzip xsltproc
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 25.2.2
asdf global erlang 25.2.2
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

# Download Elixir LS for GNU Emacs #
cd ~/dev
wget -c https://github.com/elixir-lsp/elixir-ls/releases/download/v0.13.0/elixir-ls-1.14-25.1.zip
unzip -d elixir-ls-1.14-25.1 elixir-ls-1.14-25.1.zip

# Install Sublime Text #
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y apt-transport-https sublime-text

# Install Docker and Docker Compose #
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install TFTPD #
sudo apt-get install -y tftpd-hpa
sudo sed -i 's/\/srv\/tftp/\/tmp\/tftp/g' /etc/default/tftpd-hpa

# Install NFS #
sudo apt-get install -y nfs-kernel-server
mkdir /tmp/nfs
echo '/tmp/nfs 192.168.2.0/24(rw,sync,no_root_squash,no_subtree_check)' | sudo tee -a /etc/exports
sudo exportfs -arf

# Install picocom #
sudo apt-get install -y picocom

# Install git-sim
# https://initialcommit.com/tools/git-sim
pip3 install git-sim
