#!/usr/bin/env bash

#  -----------------------------------------------------------
# |	Install Script For Rust Based Alacritty Terminal Emulator |
# |	on Debian Based Distro									  |
# |	created By: Kaif Ahmed Khan								  |
# |	github: https://github.com/ahmed-kaif					  | 
#  -----------------------------------------------------------

# clone alacritty repo
Git=$(which git)
if [[ -n $Git ]]
then
	echo "Git is already Installed."
else
	sudo apt-get install git
fi

git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Install Rust compiler with rustup
Rustup=$(which rustup)
if [[ -n $Rustup ]]
then
	# rustup is installed
	echo "Rustup is already installed. Going to next step."
else
	# rustup is not installed
	echo "Installing Rustup..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source "$HOME/.cargo/env"
fi

rustup override set stable
rustup update stable

# Installing Dependencies
echo "Installing Dependencies..."
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev \
				libxcb-xfixes0-dev libxkbcommon-dev python3

# Build Command
echo "Starting Build Process..."
cargo build --release

# Desktop Entry
echo "Adding Alacritty to Desktop Launcher.."

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Man page Entry
echo "Adding Manual Page..."
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# Bash Completion
echo "Adding Bash Completion.."
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

echo "Alacritty installed Successfully."
