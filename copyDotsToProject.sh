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

# Log function
log() {
    echo -e "$1" | tee -a "$log_file"
}

# Get the output directory
getOutputDirectory() {
    local outputDirectory="$1"

    variable=$(echo "$outputDirectory" | cut -d'/' -f2)
    if [ -n "$variable" ]; then
        echo "$variable"
    else
        echo "No character found after the first '/'"
    fi
}

# Copy function
copy_with_error_handling() {
    local functionInput="$1"
    local source="$HOME/$functionInput"
    local destination="./"

    outputDirectory=$(getOutputDirectory "$functionInput") # Capture the function's output correctly
    
    if [ -e "$source" ]; then
        cp -r "$source" "$destination" || log "$CER - An error occurred while copying the '$source' directory/file"
        log "$COK - Copied $source -----> $PWD/$outputDirectory"
    else
        log "$CER - Source '$source' does not exist."
    fi
}


# List of files/directories to copy
files_to_copy=(
    ".config/hypr"
    ".zshrc"
    ".config/neofetch"
    ".config/gtk-2.0"
    ".config/gtk-3.0"
    ".config/wlogout"
    ".config/btop"
    ".config/obs-studio"
    ".config/Thunar"
    ".config/xfce4"
    ".config/foot"
    ".config/cava"
    ".config/swappy"
    "Pictures/wallpapers"
)

# Copy each directory/file with error handling
for file in "${files_to_copy[@]}"; do
    copy_with_error_handling "$file"
done