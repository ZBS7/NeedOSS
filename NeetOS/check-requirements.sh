#!/bin/bash

# NeetOs Requirements Check Script

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  NeetOs Requirements Checker${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

ERRORS=0
WARNINGS=0

# Check OS
echo -e "${BLUE}[*] Checking Operating System...${NC}"
if [[ -f /etc/arch-release ]]; then
    echo -e "${GREEN}[✓] Arch Linux detected${NC}"
elif [[ -f /etc/manjaro-release ]]; then
    echo -e "${GREEN}[✓] Manjaro Linux detected (Arch-based)${NC}"
elif [[ -f /etc/endeavouros-release ]]; then
    echo -e "${GREEN}[✓] EndeavourOS detected (Arch-based)${NC}"
else
    echo -e "${RED}[✗] Not an Arch-based system${NC}"
    echo -e "${YELLOW}    You need Arch Linux or Arch-based distro to build NeetOs${NC}"
    ((ERRORS++))
fi
echo ""

# Check required packages
echo -e "${BLUE}[*] Checking required packages...${NC}"
REQUIRED_PKGS=("archiso" "git" "make")

for pkg in "${REQUIRED_PKGS[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo -e "${GREEN}[✓] $pkg is installed${NC}"
    else
        echo -e "${RED}[✗] $pkg is NOT installed${NC}"
        echo -e "${YELLOW}    Install with: sudo pacman -S $pkg${NC}"
        ((ERRORS++))
    fi
done
echo ""

# Check disk space
echo -e "${BLUE}[*] Checking disk space...${NC}"
AVAILABLE_SPACE=$(df . | tail -1 | awk '{print $4}')
REQUIRED_SPACE=$((20 * 1024 * 1024))  # 20GB in KB

if [[ $AVAILABLE_SPACE -ge $REQUIRED_SPACE ]]; then
    SPACE_GB=$((AVAILABLE_SPACE / 1024 / 1024))
    echo -e "${GREEN}[✓] Sufficient disk space: ${SPACE_GB}GB available${NC}"
else
    SPACE_GB=$((AVAILABLE_SPACE / 1024 / 1024))
    echo -e "${YELLOW}[!] Low disk space: ${SPACE_GB}GB available${NC}"
    echo -e "${YELLOW}    Recommended: 20GB+${NC}"
    ((WARNINGS++))
fi
echo ""

# Check RAM
echo -e "${BLUE}[*] Checking RAM...${NC}"
TOTAL_RAM=$(free -g | awk '/^Mem:/{print $2}')
if [[ $TOTAL_RAM -ge 4 ]]; then
    echo -e "${GREEN}[✓] Sufficient RAM: ${TOTAL_RAM}GB${NC}"
else
    echo -e "${YELLOW}[!] Low RAM: ${TOTAL_RAM}GB${NC}"
    echo -e "${YELLOW}    Recommended: 4GB+${NC}"
    ((WARNINGS++))
fi
echo ""

# Check internet connection
echo -e "${BLUE}[*] Checking internet connection...${NC}"
if ping -c 1 archlinux.org &>/dev/null; then
    echo -e "${GREEN}[✓] Internet connection available${NC}"
else
    echo -e "${RED}[✗] No internet connection${NC}"
    echo -e "${YELLOW}    Internet is required to download packages during build${NC}"
    ((ERRORS++))
fi
echo ""

# Check if running as root
echo -e "${BLUE}[*] Checking user permissions...${NC}"
if [[ $EUID -eq 0 ]]; then
    echo -e "${YELLOW}[!] Running as root${NC}"
    echo -e "${YELLOW}    Run this checker as normal user${NC}"
    echo -e "${YELLOW}    Run build.sh with sudo: sudo ./build.sh${NC}"
    ((WARNINGS++))
else
    echo -e "${GREEN}[✓] Running as normal user${NC}"
    if groups | grep -q wheel; then
        echo -e "${GREEN}[✓] User is in wheel group (sudo access)${NC}"
    else
        echo -e "${YELLOW}[!] User not in wheel group${NC}"
        echo -e "${YELLOW}    You may need sudo access to build${NC}"
        ((WARNINGS++))
    fi
fi
echo ""

# Check project structure
echo -e "${BLUE}[*] Checking project structure...${NC}"
REQUIRED_FILES=("build.sh" "profiledef.sh" "packages.x86_64" "README.md")

for file in "${REQUIRED_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        echo -e "${GREEN}[✓] $file exists${NC}"
    else
        echo -e "${RED}[✗] $file is missing${NC}"
        ((ERRORS++))
    fi
done

if [[ -d "airootfs" ]]; then
    echo -e "${GREEN}[✓] airootfs directory exists${NC}"
else
    echo -e "${RED}[✗] airootfs directory is missing${NC}"
    ((ERRORS++))
fi

if [[ -d "configs" ]]; then
    echo -e "${GREEN}[✓] configs directory exists${NC}"
else
    echo -e "${RED}[✗] configs directory is missing${NC}"
    ((ERRORS++))
fi
echo ""

# Summary
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Summary${NC}"
echo -e "${BLUE}========================================${NC}"

if [[ $ERRORS -eq 0 ]] && [[ $WARNINGS -eq 0 ]]; then
    echo -e "${GREEN}[✓] All checks passed!${NC}"
    echo -e "${GREEN}    You're ready to build NeetOs${NC}"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo "  1. chmod +x build.sh"
    echo "  2. sudo ./build.sh"
elif [[ $ERRORS -eq 0 ]]; then
    echo -e "${YELLOW}[!] ${WARNINGS} warning(s) found${NC}"
    echo -e "${YELLOW}    Build may work but not optimal${NC}"
    echo ""
    echo -e "${BLUE}You can try to build anyway:${NC}"
    echo "  sudo ./build.sh"
else
    echo -e "${RED}[✗] ${ERRORS} error(s) found${NC}"
    if [[ $WARNINGS -gt 0 ]]; then
        echo -e "${YELLOW}[!] ${WARNINGS} warning(s) found${NC}"
    fi
    echo -e "${RED}    Please fix errors before building${NC}"
fi

echo ""
exit $ERRORS
