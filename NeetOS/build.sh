#!/bin/bash
set -e

#############################################
# NeetOs Build Script
# Автоматическая сборка кастомного ISO
#############################################

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# ASCII Art Logo
print_logo() {
    echo -e "${PURPLE}"
    cat << "EOF"
    _   __          __  ____     
   / | / /__  ___  / /_/ __ \____
  /  |/ / _ \/ _ \/ __/ / / / __ \
 / /|  /  __/  __/ /_/ /_/ / /_/ /
/_/ |_/\___/\___/\__/\____/\____/ 
                                  
    Cyber-Minimalist Linux OS
EOF
    echo -e "${NC}"
}

# Проверка прав root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[!] Этот скрипт должен быть запущен с правами root${NC}"
        echo "Используй: sudo ./build.sh"
        exit 1
    fi
}

# Проверка зависимостей
check_dependencies() {
    echo -e "${BLUE}[*] Проверка зависимостей...${NC}"
    
    local deps=("archiso" "git" "make")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! pacman -Qi "$dep" &>/dev/null; then
            missing+=("$dep")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        echo -e "${YELLOW}[!] Не найдены следующие пакеты: ${missing[*]}${NC}"
        echo -e "${BLUE}[*] Установка недостающих зависимостей...${NC}"
        pacman -Sy --needed --noconfirm "${missing[@]}"
    else
        echo -e "${GREEN}[✓] Все зависимости установлены${NC}"
    fi
}

# Создание рабочей директории
setup_workspace() {
    echo -e "${BLUE}[*] Создание рабочей директории...${NC}"
    
    local WORK_DIR="./work"
    local PROFILE_DIR="$WORK_DIR/neetos"
    
    # Очистка старой рабочей директории
    if [[ -d "$WORK_DIR" ]]; then
        echo -e "${YELLOW}[!] Удаление старой рабочей директории...${NC}"
        rm -rf "$WORK_DIR"
    fi
    
    # Создание новой структуры
    mkdir -p "$WORK_DIR"
    
    # Копирование базового профиля archiso
    echo -e "${BLUE}[*] Копирование базового профиля releng...${NC}"
    cp -r /usr/share/archiso/configs/releng "$PROFILE_DIR"
    
    echo -e "${GREEN}[✓] Рабочая директория создана: $PROFILE_DIR${NC}"
    echo "$PROFILE_DIR"
}

# Настройка профиля
configure_profile() {
    local PROFILE_DIR="$1"
    
    echo -e "${BLUE}[*] Настройка профиля NeetOs...${NC}"
    
    # Копирование списка пакетов
    if [[ -f "./packages.x86_64" ]]; then
        cp "./packages.x86_64" "$PROFILE_DIR/"
        echo -e "${GREEN}[✓] Список пакетов скопирован${NC}"
    fi
    
    # Копирование profiledef.sh
    if [[ -f "./profiledef.sh" ]]; then
        cp "./profiledef.sh" "$PROFILE_DIR/"
        echo -e "${GREEN}[✓] profiledef.sh скопирован${NC}"
    fi
    
    # Создание структуры airootfs
    mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config"
    mkdir -p "$PROFILE_DIR/airootfs/etc/systemd/system"
    mkdir -p "$PROFILE_DIR/airootfs/usr/local/bin"
    mkdir -p "$PROFILE_DIR/airootfs/usr/share/backgrounds"
    
    # Копирование airootfs если существует
    if [[ -d "./airootfs" ]]; then
        cp -r ./airootfs/* "$PROFILE_DIR/airootfs/" 2>/dev/null || true
        
        # Установка прав на исполняемые файлы
        chmod +x "$PROFILE_DIR/airootfs/usr/local/bin/"* 2>/dev/null || true
        chmod +x "$PROFILE_DIR/airootfs/root/.automated_script.sh" 2>/dev/null || true
        
        echo -e "${GREEN}[✓] Файлы airootfs скопированы${NC}"
    fi
    
    # Копирование конфигураций
    if [[ -d "./configs" ]]; then
        # Hyprland
        mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config/hypr"
        if [[ -f "./configs/hyprland/hyprland.conf" ]]; then
            cp ./configs/hyprland/hyprland.conf "$PROFILE_DIR/airootfs/etc/skel/.config/hypr/"
        fi
        
        # Waybar
        mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config/waybar"
        if [[ -d "./configs/waybar" ]]; then
            cp -r ./configs/waybar/* "$PROFILE_DIR/airootfs/etc/skel/.config/waybar/" 2>/dev/null || true
        fi
        
        # Kitty
        mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config/kitty"
        if [[ -f "./configs/kitty/kitty.conf" ]]; then
            cp ./configs/kitty/kitty.conf "$PROFILE_DIR/airootfs/etc/skel/.config/kitty/"
        fi
        
        # Rofi
        mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config/rofi"
        if [[ -f "./configs/rofi/config.rasi" ]]; then
            cp ./configs/rofi/config.rasi "$PROFILE_DIR/airootfs/etc/skel/.config/rofi/"
        fi
        
        # SDDM
        mkdir -p "$PROFILE_DIR/airootfs/etc/sddm.conf.d"
        if [[ -f "./configs/sddm/sddm.conf" ]]; then
            cp ./configs/sddm/sddm.conf "$PROFILE_DIR/airootfs/etc/sddm.conf.d/"
        fi
        
        echo -e "${GREEN}[✓] Конфигурации скопированы${NC}"
    fi
}

# Сборка ISO
build_iso() {
    local PROFILE_DIR="$1"
    local OUTPUT_DIR="./out"
    
    echo -e "${BLUE}[*] Начинается сборка ISO...${NC}"
    echo -e "${YELLOW}[!] Это может занять 20-40 минут...${NC}"
    
    mkdir -p "$OUTPUT_DIR"
    
    # Запуск mkarchiso
    cd "$PROFILE_DIR"
    mkarchiso -v -w ./work -o "../../$OUTPUT_DIR" ./
    
    cd - > /dev/null
    
    echo -e "${GREEN}[✓] Сборка завершена!${NC}"
}

# Главная функция
main() {
    print_logo
    
    echo -e "${PURPLE}======================================${NC}"
    echo -e "${PURPLE}  NeetOs ISO Builder v1.0${NC}"
    echo -e "${PURPLE}======================================${NC}"
    echo ""
    
    check_root
    check_dependencies
    
    local PROFILE_DIR=$(setup_workspace)
    configure_profile "$PROFILE_DIR"
    build_iso "$PROFILE_DIR"
    
    echo ""
    echo -e "${GREEN}======================================${NC}"
    echo -e "${GREEN}  ✓ Сборка успешно завершена!${NC}"
    echo -e "${GREEN}======================================${NC}"
    echo ""
    echo -e "${BLUE}ISO-образ находится в:${NC}"
    echo -e "${YELLOW}  ./out/neetos-*.iso${NC}"
    echo ""
    echo -e "${BLUE}Для тестирования в VirtualBox:${NC}"
    echo "  1. Создай новую VM (Linux/Arch Linux 64-bit)"
    echo "  2. ОЗУ: 4GB+, Видео: 128MB, 3D: Включено"
    echo "  3. Подключи ISO и запусти"
    echo ""
    echo -e "${PURPLE}Приятного использования NeetOs!${NC}"
}

# Запуск
main "$@"
