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

    log "$CER - An error occurred. Exiting..."
    exit 1
}


# Copy the hypr folder to the current directory
cp -r ~/.config/hypr/ ./ || handle_error
log "$COK - Copied hypr/ to current directory."

# Copy the .zshrc file to the current directory
cp ~/.zshrc ./ || handle_error
log "$COK - Copied .zshrc to current directory."

# Copy the neofetch folder to current directory
cp -r ~/.config/neofetch/ ./ || handle_error
log "$COK - Copied neofetch/ to current directory."

# Copy the gtk-2.0 folder to current directory
cp -r ~/.config/gtk-2.0/ ./ || handle_error
log "$COK - Copied gtk-2.0/ to current directory."

# Copy the gtk-3.0 folder to current directory
cp -r ~/.config/gtk-3.0/ ./ || handle_error
log "$COK - Copied gtk-3.0/ to current directory."

# Copy the wlogout folder to current directory
cp -r ~/.config/wlogout/ ./ || handle_error
log "$COK - Copied wlogout/ to current directory."

# Copy the btop folder to current directory
cp -r ~/.config/btop/ ./ || handle_error
log "$COK - Copied btop/ to current directory."

# Copy the obs-studio folder to current directory
cp -r ~/.config/obs-studio/ ./ || handle_error
log "$COK - Copied obs-studio/ to current directory."