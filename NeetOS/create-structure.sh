#!/bin/bash

# Script to create proper directory structure for NeetOs build

echo "Creating NeetOs directory structure..."

# Main directories
mkdir -p configs/{hyprland,waybar,kitty,sddm,rofi}
mkdir -p airootfs/{etc/skel/.config,etc/systemd/system,usr/local/bin,usr/share/backgrounds}
mkdir -p airootfs/etc/skel/.config/{gtk-3.0,gtk-4.0,hypr,waybar,kitty,rofi,autostart}

# Copy configs to airootfs
echo "Copying configurations..."

# Hyprland
if [ -d "configs/hyprland" ]; then
    cp -r configs/hyprland/* airootfs/etc/skel/.config/hypr/ 2>/dev/null || true
fi

# Waybar
if [ -d "configs/waybar" ]; then
    cp -r configs/waybar/* airootfs/etc/skel/.config/waybar/ 2>/dev/null || true
fi

# Kitty
if [ -d "configs/kitty" ]; then
    cp -r configs/kitty/* airootfs/etc/skel/.config/kitty/ 2>/dev/null || true
fi

# Rofi
if [ -d "configs/rofi" ]; then
    cp -r configs/rofi/* airootfs/etc/skel/.config/rofi/ 2>/dev/null || true
fi

# SDDM
if [ -d "configs/sddm" ]; then
    mkdir -p airootfs/etc/sddm.conf.d
    cp configs/sddm/sddm.conf airootfs/etc/sddm.conf.d/ 2>/dev/null || true
fi

# Make scripts executable
chmod +x airootfs/usr/local/bin/* 2>/dev/null || true
chmod +x airootfs/root/.automated_script.sh 2>/dev/null || true

echo "✓ Directory structure created successfully!"
echo ""
echo "Next steps:"
echo "1. Run: chmod +x build.sh"
echo "2. Run: sudo ./build.sh"
