# Инструкция по установке и использованию NeetOs

## Системные требования

### Для сборки ISO:
- **Хост-система**: Arch Linux или Arch-based дистрибутив (Manjaro, EndeavourOS, etc.)
- **Процессор**: x86_64 (64-bit)
- **ОЗУ**: 4GB+
- **Свободное место**: 20GB+
- **Интернет**: Стабильное соединение

### Для запуска NeetOs:
- **VM**: VirtualBox 6.0+ или VMware Workstation 15+
- **ОЗУ**: 4GB+ (рекомендуется 8GB)
- **Видео**: 128MB, с 3D-ускорением
- **Диск**: 20GB+

## Пошаговая сборка

### 1. Подготовка хост-системы

Если у тебя еще нет Arch Linux, можешь использовать виртуальную машину с Arch или WSL2 с Arch.

```bash
# Обновить систему
sudo pacman -Syu

# Установить необходимые пакеты
sudo pacman -S archiso git base-devel
```

### 2. Клонирование проекта

```bash
# Скачай и распакуй проект NeetOs
# Или создай директорию и скопируй все файлы туда
mkdir -p ~/neetos
cd ~/neetos

# Структура должна выглядеть так:
# neetos/
# ├── build.sh
# ├── profiledef.sh
# ├── packages.x86_64
# ├── pacman.conf
# ├── configs/
# ├── airootfs/
# └── README.md
```

### 3. Запуск сборки

```bash
# Дай права на выполнение скрипту
chmod +x build.sh

# Запусти сборку (требуется sudo)
sudo ./build.sh
```

**Процесс сборки:**
- Проверка зависимостей
- Создание рабочей директории
- Копирование профиля Archiso
- Загрузка пакетов (~2-3GB)
- Настройка системы
- Создание squashfs образа
- Сборка ISO

**Время сборки**: 20-40 минут (зависит от скорости интернета и CPU)

### 4. Результат

После успешной сборки ISO-образ будет находиться в:
```
./out/neetos-YYYY.MM.DD-x86_64.iso
```

## Запуск в VirtualBox

### Создание виртуальной машины:

1. **Открой VirtualBox** → Создать новую VM

2. **Настройки VM**:
   ```
   Имя: NeetOs
   Тип: Linux
   Версия: Arch Linux (64-bit)
   ```

3. **Оборудование**:
   ```
   ОЗУ: 4096 MB (рекомендуется 8192 MB)
   Процессоры: 2+ ядра
   ```

4. **Видео**:
   ```
   Видеопамять: 128 MB
   Графический контроллер: VMSVGA
   ☑ Включить 3D-ускорение
   ```

5. **Дисплей**:
   ```
   Разрешение: 1920x1080 или выше
   ```

6. **Хранилище**:
   ```
   - Контроллер IDE: [добавь ISO как CD/DVD]
   - Контроллер SATA: Создай виртуальный диск 20GB+
   ```

7. **Сеть**:
   ```
   Тип: NAT или Сетевой мост
   ```

8. **Система**:
   ```
   ☑ Включить EFI
   Порядок загрузки: Optical, HDD
   ```

### Запуск:

1. Выбери VM → Запустить
2. Система загрузится в live-режим
3. Автоматический вход как пользователь `neet`
4. Hyprland запустится автоматически

## Запуск в VMware

### Создание виртуальной машины:

1. **File** → **New Virtual Machine**

2. **Configuration**:
   ```
   Тип конфигурации: Custom (advanced)
   Версия оборудования: Workstation 15.x или новее
   ```

3. **Гостевая ОС**:
   ```
   Guest OS: Linux
   Version: Other Linux 5.x kernel 64-bit
   ```

4. **Оборудование**:
   ```
   ОЗУ: 4096 MB (рекомендуется 8192 MB)
   Процессоры: 2+ ядра
   Диск: 20GB+
   ```

5. **Display**:
   ```
   ☑ Accelerate 3D graphics
   Graphics Memory: 2GB
   ```

6. **CD/DVD**:
   ```
   ☑ Connect at power on
   Use ISO image: [выбери neetos.iso]
   ```

7. **Edit VM Settings** → **Options** → **Advanced**:
   ```
   Firmware type: UEFI (рекомендуется)
   ```

### Запуск:

1. Power On VM
2. Live система загрузится автоматически
3. Вход как `neet` / `neet`

## Использование NeetOs

### Горячие клавиши (Hyprland)

| Комбинация | Действие |
|------------|----------|
| `Super + Return` | Открыть терминал (Kitty) |
| `Super + D` | Launcher приложений (Rofi) |
| `Super + E` | Файловый менеджер (Thunar) |
| `Super + B` | Браузер (Firefox) |
| `Super + Q` | Закрыть окно |
| `Super + M` | Выход из Hyprland |
| `Super + F` | Полноэкранный режим |
| `Super + V` | Плавающий режим окна |
| `Super + 1-9` | Переключение рабочих столов |
| `Print` | Скриншот области |
| `Super + Print` | Скриншот экрана |

### Учетные данные по умолчанию

```
Пользователь: neet
Пароль: neet

Root пароль: root
```

### Предустановленный софт

**Система:**
- Waybar (панель задач)
- Rofi (launcher)
- Kitty (терминал)
- Thunar (файловый менеджер)

**Разработка:**
- VS Code
- Neovim
- Git
- Node.js + npm
- Python + pip

**Интернет:**
- Firefox
- NetworkManager

**Мониторинг:**
- btop (системный монитор)
- htop
- fastfetch (system info)

**Гейминг:**
- Steam
- Wine
- Lutris

### Установка дополнительного софта

#### Pacman (официальные репозитории):
```bash
sudo pacman -S <package_name>
```

#### Flatpak:
```bash
# Установить Flatpak (если еще не установлен)
sudo pacman -S flatpak

# Добавить Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Установить приложение
flatpak install flathub <app_id>
```

#### AUR (с помощью yay):
```bash
# Установить yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Использование
yay -S <package_name>
```

## Установка на диск (опционально)

NeetOs работает как live-система, но ты можешь установить её на диск:

```bash
# Открой терминал
# Запусти установщик Arch (или используй archinstall)
sudo archinstall

# Следуй инструкциям для установки базовой системы
# После установки скопируй конфигурации из /etc/skel
```

## Кастомизация

### Изменить обои:
```bash
# Замени обои в ~/.config/backgrounds/
# Или используй swaybg в Hyprland config
```

### Изменить тему:
```bash
# GTK темы
lxappearance

# Редактировать Hyprland
nvim ~/.config/hypr/hyprland.conf

# Редактировать Waybar
nvim ~/.config/waybar/config
nvim ~/.config/waybar/style.css
```

### Изменить терминал:
```bash
nvim ~/.config/kitty/kitty.conf
```

## Решение проблем

### Чёрный экран после загрузки:
```bash
# Нажми Ctrl+Alt+F2 для входа в TTY
# Войди как neet / neet
# Проверь статус SDDM:
sudo systemctl status sddm

# Перезапусти:
sudo systemctl restart sddm
```

### Hyprland не запускается:
```bash
# Проверь логи
cat ~/.cache/hyprland/hyprland.log

# Запусти вручную
Hyprland
```

### Нет интернета:
```bash
# Проверь NetworkManager
sudo systemctl status NetworkManager

# Перезапусти
sudo systemctl restart NetworkManager

# Подключись к Wi-Fi
nmtui
```

### Низкая производительность в VM:
1. Увеличь ОЗУ до 8GB
2. Добавь больше CPU ядер
3. Включи 3D-ускорение
4. Установи Guest Additions/Tools

## Поддержка

Для вопросов и багов создай issue в репозитории проекта.

**Приятного использования NeetOs! 🚀**
