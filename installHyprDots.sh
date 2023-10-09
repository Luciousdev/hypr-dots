#!/bin/bash

# Set some colors
CNT=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 6)$(tput bold)NOTE$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
COK=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 2)$(tput bold)OK$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CER=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 1)$(tput bold)ERROR$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CAT=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 7)$(tput bold)ATTENTION$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CWR=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 5)$(tput bold)WARNING$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CAC=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 3)$(tput bold)ACTION$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CIN=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 4)$(tput bold)INPUT$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CDE=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 7)$(tput bold)DEBUG$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)
CPR=$(tput setaf 7)$(tput bold)"["$(tput sgr0)$(tput setaf 7)$(tput bold)PROGRESS$(tput sgr0)$(tput setaf 7)$(tput bold)"]"$(tput sgr0)

log_file="copy-dots.log"

# Function to log output to the log file
log() {
    echo -e "$1" | tee -a "$log_file"
}

# Function to handle errors
handle_error() {
    local argument=$1

    log "$CER - An error occurred while copying '$argument' to target directory."
    exit 1
}

foldersToCopy=("hypr" "btop" "gtk-2.0" "gtk-3.0" "neofetch" "obs-studio" "wlogout" "Thunar" "xfce4" "foot" "cava" "swappy")
target_directory="$HOME/.config"

for folderToCopy in "${foldersToCopy[@]}"; do
    if [ -d "$folderToCopy" ]; then
        mv "$folderToCopy" "$target_directory" || handle_error "$folderToCopy"
        log "$COK - Moved $folderToCopy folder to $target_directory"
    else
        echo "Folder '$folderToCopy' not found in the current directory."
    fi
done

# Move the wallpapers folder to ~/Pictures/
if [ -d "wallpapers" ]; then
    mv wallpapers "$HOME/Pictures/" || handle_error "wallpapers"
    log "$COK - Moved wallpapers folder to $HOME/Pictures/"
else
    log "$CER - Folder 'wallpapers' not found in the current directory." 
fi

# Move the .zshrc file to ~/
if [ -f ".zshrc" ]; then
    mv .zshrc "$HOME/" || handle_error ".zshrc"
    log "$COK - Moved .zshrc file to $HOME/"
else
    log "$CER - File '.zshrc' not found in the current directory."
fi

# Move .oh-my-zsh/ to ~/
if [ -d ".oh-my-zsh" ]; then
    mv .oh-my-zsh "$HOME/" || handle_error ".oh-my-zsh"
    log "$COK - Moved .oh-my-zsh folder to $HOME/"
else
    log "$CER - Folder '.oh-my-zsh' not found in the current directory."
fi

if [ -f ".p10k.zsh" ]; then
    mv .p10k.zsh "$HOME/" || handle_error ".p10k.zsh"
    log "$COK - Moved .p10k.zsh file to $HOME/"
else
    log "$CER - File '.p10k.zsh' not found in the current directory."
fi