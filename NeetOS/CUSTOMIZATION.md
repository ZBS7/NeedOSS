# Руководство по кастомизации NeetOs

## Изменение списка пакетов

Отредактируй файл `packages.x86_64` перед сборкой:

```bash
nano packages.x86_64
```

### Добавление пакетов:
Просто добавь название пакета на новую строку:
```
telegram-desktop
discord
vlc
```

### Удаление пакетов:
Закомментируй строку с `#` или удали её:
```
# steam          # Удалить Steam
# lutris         # Удалить Lutris
```

### Поиск пакетов:
```bash
# Поиск в официальных репозиториях
pacman -Ss <название>

# Поиск в AUR (требуется yay)
yay -Ss <название>
```

## Изменение темы Hyprland

### Цвета границ окон:
Редактируй `configs/hyprland/hyprland.conf`:

```conf
general {
    # Активная граница (градиент)
    col.active_border = rgba(00ff99ee) rgba(00ccffee) 45deg
    
    # Неактивная граница
    col.inactive_border = rgba(33333399)
}
```

### Цветовые схемы:

**Cyberpunk Green/Cyan (по умолчанию):**
```conf
col.active_border = rgba(00ff99ee) rgba(00ccffee) 45deg
```

**Purple/Pink:**
```conf
col.active_border = rgba(ff00ffee) rgba(ff0099ee) 45deg
```

**Red/Orange:**
```conf
col.active_border = rgba(ff0000ee) rgba(ff9900ee) 45deg
```

**Blue/Purple:**
```conf
col.active_border = rgba(0099ffee) rgba(9900ffee) 45deg
```

### Размытие и эффекты:
```conf
decoration {
    rounding = 12              # Закругление углов (0-20)
    
    blur {
        size = 8              # Размер размытия (1-20)
        passes = 3            # Проходы размытия (1-4)
    }
    
    drop_shadow = true        # Тени
    shadow_range = 30         # Радиус тени
}
```

### Анимации:
```conf
animations {
    enabled = true
    
    # Скорость анимаций
    animation = windows, 1, 5, cybercurve, slide       # 5 = скорость
    animation = workspaces, 1, 6, cybercurve, slide    # 6 = скорость
}
```

Отключить анимации полностью:
```conf
animations {
    enabled = false
}
```

## Изменение Waybar

### Цвета панели:
Редактируй `configs/waybar/style.css`:

```css
window#waybar {
    background: rgba(20, 20, 30, 0.85);      /* Фон панели */
    border: 2px solid rgba(0, 255, 153, 0.3); /* Граница */
}
```

### Позиция панели:
Редактируй `configs/waybar/config`:

```json
{
    "position": "top",        // top, bottom, left, right
    "height": 36,            // Высота в пикселях
}
```

### Модули панели:
```json
{
    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": ["pulseaudio", "network", "cpu", "memory", "battery", "tray"]
}
```

Добавить модуль (например, температуру):
```json
"temperature": {
    "format": " {temperatureC}°C"
}
```

## Изменение терминала Kitty

### Цветовая схема:
Редактируй `configs/kitty/kitty.conf`:

```conf
# Основные цвета
foreground #e0e0e0    # Цвет текста
background #0a0a0f    # Цвет фона

# Прозрачность
background_opacity 0.92    # 0.0-1.0 (0 = полностью прозрачно)
background_blur 20         # Размытие фона
```

### Шрифт:
```conf
font_family      JetBrains Mono
font_size 12.0
```

Доступные шрифты:
```bash
fc-list | grep -i mono
```

### Курсор:
```conf
cursor_shape beam          # beam, block, underline
cursor_blink_interval 0.5  # Скорость мигания
```

## Добавление обоев

1. Подготовь изображение (JPG/PNG, рекомендуется 1920x1080+)

2. Добавь его в проект:
```bash
mkdir -p airootfs/usr/share/backgrounds
cp your-wallpaper.jpg airootfs/usr/share/backgrounds/neetos-wallpaper.jpg
```

3. Обои автоматически применятся через `swaybg` в Hyprland config

Или используй URL:
```conf
exec-once = swaybg -i https://example.com/wallpaper.jpg -m fill
```

## Изменение приветственного экрана

Редактируй `airootfs/usr/local/bin/neetos-welcome`:

```bash
cat << "EOF"
    ╔═══════════════════════════════╗
    ║     Твой кастомный текст     ║
    ╚═══════════════════════════════╝
EOF
```

Добавить ASCII art:
```bash
# Используй генераторы: https://patorjk.com/software/taag/
# Или: figlet "NeetOs"
```

## Автозапуск приложений

Создай `.desktop` файл в `airootfs/etc/skel/.config/autostart/`:

```bash
nano airootfs/etc/skel/.config/autostart/myapp.desktop
```

Содержимое:
```ini
[Desktop Entry]
Type=Application
Name=My Application
Exec=/usr/bin/myapp
Terminal=false
X-GNOME-Autostart-enabled=true
```

Примеры:
- `firefox` - Браузер
- `discord` - Discord
- `telegram-desktop` - Telegram
- `steam -silent` - Steam в трее

## Изменение горячих клавиш

Редактируй `configs/hyprland/hyprland.conf`:

```conf
# Изменить модификатор (SUPER → ALT)
$mainMod = ALT

# Добавить новую комбинацию
bind = $mainMod, T, exec, telegram-desktop

# Изменить существующую
bind = $mainMod, RETURN, exec, alacritty  # Вместо kitty
```

Доступные клавиши:
- Модификаторы: `SUPER`, `ALT`, `CTRL`, `SHIFT`
- Специальные: `RETURN`, `TAB`, `SPACE`, `Print`
- Функциональные: `F1-F12`
- Мультимедиа: `XF86AudioPlay`, `XF86AudioNext`, etc.

## Изменение языка и раскладки

### Раскладка клавиатуры:
Редактируй `configs/hyprland/hyprland.conf`:

```conf
input {
    kb_layout = us,ru           # Раскладки
    kb_options = grp:alt_shift_toggle  # Переключение
}
```

Доступные опции переключения:
- `grp:alt_shift_toggle` - Alt+Shift
- `grp:ctrl_shift_toggle` - Ctrl+Shift
- `grp:win_space_toggle` - Win+Space
- `grp:caps_toggle` - CapsLock

### Системная локаль:
Редактируй `airootfs/etc/locale.gen` и добавь локали:

```
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
de_DE.UTF-8 UTF-8
```

Затем в `airootfs/etc/locale.conf`:
```
LANG=ru_RU.UTF-8
```

## Добавление скриптов запуска

Создай скрипт в `airootfs/usr/local/bin/`:

```bash
nano airootfs/usr/local/bin/my-script
```

```bash
#!/bin/bash
# Твой скрипт
echo "Hello from NeetOs!"
```

Сделай исполняемым:
```bash
chmod +x airootfs/usr/local/bin/my-script
```

Добавь в autostart или вызывай из Hyprland config:
```conf
exec-once = /usr/local/bin/my-script
```

## Изменение логина и пароля

Редактируй `airootfs/root/.automated_script.sh`:

```bash
# Изменить имя пользователя и пароль
useradd -m -G wheel,audio,video,storage,optical,network -s /bin/zsh your_username
echo "your_username:your_password" | chpasswd
echo "root:your_root_password" | chpasswd
```

## Тестирование изменений

После любых изменений:

1. Сохрани все файлы
2. Запусти сборку:
```bash
sudo ./build.sh
```

3. Проверь в VM

## Быстрые пресеты

### Минимальная система (без gaming):
Удали из `packages.x86_64`:
```
steam
wine
wine-mono
wine-gecko
winetricks
lutris
gamemode
lib32-gamemode
```

### Максимальная система:
Добавь в `packages.x86_64`:
```
telegram-desktop
discord
vlc
gimp
libreoffice-fresh
obs-studio
kdenlive
blender
```

### Для разработчиков:
Добавь:
```
docker
docker-compose
postgresql
redis
mongodb
nginx
apache
```

---

После кастомизации не забудь обновить README.md с описанием своих изменений!
