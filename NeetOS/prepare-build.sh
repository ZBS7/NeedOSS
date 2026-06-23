#!/bin/bash

# NeetOs Build Preparation Script
# Подготавливает все файлы и директории для сборки

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  NeetOs Build Preparation${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 1. Create directory structure
echo -e "${BLUE}[1/5] Creating directory structure...${NC}"
mkdir -p configs/{hyprland,waybar,kitty,sddm,rofi}
mkdir -p airootfs/{etc/skel/.config,etc/systemd/system,usr/local/bin,usr/share/backgrounds}
mkdir -p airootfs/etc/skel/.config/{gtk-3.0,gtk-4.0,hypr,waybar,kitty,rofi,autostart,dunst,neofetch}
mkdir -p airootfs/etc/sddm.conf.d
mkdir -p airootfs/root
echo -e "${GREEN}[✓] Directories created${NC}"

# 2. Copy configs to airootfs
echo -e "${BLUE}[2/5] Copying configurations...${NC}"

# Hyprland
if [ -f "configs/hyprland/hyprland.conf" ]; then
    cp configs/hyprland/hyprland.conf airootfs/etc/skel/.config/hypr/
    echo -e "${GREEN}  [✓] Hyprland config${NC}"
fi

# Waybar
if [ -d "configs/waybar" ]; then
    cp configs/waybar/* airootfs/etc/skel/.config/waybar/ 2>/dev/null || true
    echo -e "${GREEN}  [✓] Waybar config${NC}"
fi

# Kitty
if [ -f "configs/kitty/kitty.conf" ]; then
    cp configs/kitty/kitty.conf airootfs/etc/skel/.config/kitty/
    echo -e "${GREEN}  [✓] Kitty config${NC}"
fi

# Rofi
if [ -f "configs/rofi/config.rasi" ]; then
    cp configs/rofi/config.rasi airootfs/etc/skel/.config/rofi/
    echo -e "${GREEN}  [✓] Rofi config${NC}"
fi

# SDDM
if [ -f "configs/sddm/sddm.conf" ]; then
    cp configs/sddm/sddm.conf airootfs/etc/sddm.conf.d/
    echo -e "${GREEN}  [✓] SDDM config${NC}"
fi

# 3. Set executable permissions
echo -e "${BLUE}[3/5] Setting file permissions...${NC}"
if [ -d "airootfs/usr/local/bin" ]; then
    chmod +x airootfs/usr/local/bin/* 2>/dev/null || true
fi
if [ -f "airootfs/root/.automated_script.sh" ]; then
    chmod +x airootfs/root/.automated_script.sh
fi
chmod +x build.sh 2>/dev/null || true
chmod +x check-requirements.sh 2>/dev/null || true
chmod +x create-structure.sh 2>/dev/null || true
echo -e "${GREEN}[✓] Permissions set${NC}"

# 4. Validate required files
echo -e "${BLUE}[4/5] Validating project files...${NC}"
REQUIRED_FILES=(
    "build.sh"
    "profiledef.sh"
    "packages.x86_64"
    "pacman.conf"
    "README.md"
)

MISSING=0
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}  [✓] $file${NC}"
    else
        echo -e "${YELLOW}  [!] $file is missing${NC}"
        ((MISSING++))
    fi
done

if [ $MISSING -gt 0 ]; then
    echo -e "${YELLOW}[!] Some files are missing, but continuing...${NC}"
fi

# 5. Check for wallpaper
echo -e "${BLUE}[5/5] Checking additional resources...${NC}"
if [ -f "airootfs/usr/share/backgrounds/neetos-wallpaper.jpg" ]; then
    echo -e "${GREEN}  [✓] Wallpaper found${NC}"
else
    echo -e "${YELLOW}  [!] Wallpaper not found (optional)${NC}"
    echo -e "${YELLOW}      Add your wallpaper to: airootfs/usr/share/backgrounds/neetos-wallpaper.jpg${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Preparation Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Project structure:${NC}"
tree -L 2 -d . 2>/dev/null || find . -type d -maxdepth 2 | sed 's|[^/]*/| |g'
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Run requirements check:"
echo -e "     ${YELLOW}./check-requirements.sh${NC}"
echo ""
echo "  2. Start the build:"
echo -e "     ${YELLOW}sudo ./build.sh${NC}"
echo ""
echo -e "${BLUE}Estimated build time: 20-40 minutes${NC}"
echo -e "${BLUE}Result will be in: ./out/neetos-*.iso${NC}"
