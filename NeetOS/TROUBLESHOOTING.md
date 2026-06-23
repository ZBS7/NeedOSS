# Решение проблем NeetOs

## Проблемы при сборке

### ❌ "archiso not found"
```
Ошибка: команда archiso не найдена
```

**Решение:**
```bash
sudo pacman -S archiso
```

---

### ❌ "Permission denied"
```
bash: ./build.sh: Permission denied
```

**Решение:**
```bash
chmod +x build.sh
chmod +x check-requirements.sh
chmod +x prepare-build.sh
```

---

### ❌ "mkarchiso: command not found"
```
mkarchiso: команда не найдена
```

**Решение:**
Установи archiso:
```bash
sudo pacman -S archiso
```

Если уже установлен, проверь PATH:
```bash
which mkarchiso
# Должно вывести: /usr/bin/mkarchiso
```

---

### ❌ "No space left on device"
```
cp: error writing: No space left on device
```

**Решение:**
1. Проверь свободное место:
```bash
df -h .
```

2. Освободи минимум 20GB

3. Очисти кеш pacman:
```bash
sudo pacman -Sc
```

4. Удали старую рабочую директорию:
```bash
sudo rm -rf work/ out/
```

---

### ❌ Ошибки загрузки пакетов
```
error: failed retrieving file
```

**Решение:**
1. Проверь интернет:
```bash
ping archlinux.org
```

2. Обнови mirrorlist:
```bash
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

3. Обнови базу данных:
```bash
sudo pacman -Syy
```

---

### ❌ "Package not found"
```
error: target not found: package-name
```

**Решение:**
1. Проверь название пакета:
```bash
pacman -Ss package-name
```

2. Удали пакет из `packages.x86_64` если он больше не существует

3. Для AUR-пакетов нужен специальный подход (см. CUSTOMIZATION.md)

---

## Проблемы при загрузке ISO

### ❌ Чёрный экран после загрузки

**Причина:** SDDM не запустился

**Решение 1:** TTY доступ
```bash
# Нажми Ctrl+Alt+F2
# Войди: neet / neet

# Проверь статус
sudo systemctl status sddm

# Перезапусти
sudo systemctl restart sddm
```

**Решение 2:** Запуск Hyprland вручную
```bash
# В TTY
Hyprland
```

**Решение 3:** Проверь логи
```bash
journalctl -u sddm -b
cat ~/.cache/hyprland/hyprland.log
```

---

### ❌ "Failed to start Display Manager"

**Решение:**
```bash
# Проверь зависимости
pacman -Q sddm qt5-graphicaleffects

# Переустанови SDDM
sudo pacman -S --overwrite "*" sddm

# Включи сервис
sudo systemctl enable sddm
sudo systemctl start sddm
```

---

### ❌ Зависание на логотипе загрузки

**Причина:** Драйверы видео или медленная VM

**Решение:**
1. Увеличь ОЗУ VM до 8GB
2. Добавь больше CPU ядер
3. Включи 3D-ускорение в настройках VM
4. Подожди 2-3 минуты (первый запуск медленный)

---

### ❌ Boot loop / перезагрузка

**Решение:**
1. В GRUB выбери "Fallback" режим
2. Или добавь kernel параметр: `nomodeset`
3. В настройках VM: отключи EFI, используй BIOS

---

## Проблемы с Hyprland

### ❌ Hyprland не запускается

**Проверка:**
```bash
cat ~/.cache/hyprland/hyprland.log
```

**Частые ошибки:**

1. **"Failed to create backend"**
```bash
# Проверь Wayland
echo $XDG_SESSION_TYPE
# Должно быть: wayland

# Переменные окружения
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
```

2. **"No GPU found"**
```bash
# В VM включи 3D-ускорение
# VirtualBox: Настройки → Дисплей → Включить 3D
# VMware: 3D graphics acceleration
```

---

### ❌ Нет обоев

**Решение:**
```bash
# Проверь путь в конфиге
nano ~/.config/hypr/hyprland.conf

# Найди строку:
exec-once = swaybg -i ~/.config/backgrounds/neetos-wallpaper.jpg -m fill

# Добавь свои обои или используй цвет:
exec-once = swaybg -c '#0a0a0f'
```

---

### ❌ Waybar не отображается

**Решение:**
```bash
# Запусти вручную
waybar &

# Проверь конфиг
nano ~/.config/waybar/config

# Проверь процесс
ps aux | grep waybar

# Убей старый процесс
killall waybar
waybar &
```

---

## Проблемы с периферией

### ❌ Нет интернета

**Решение 1:** NetworkManager
```bash
# Проверь сервис
sudo systemctl status NetworkManager

# Запусти
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# GUI настройка
nmtui
```

**Решение 2:** Для Wi-Fi
```bash
# Список сетей
nmcli device wifi list

# Подключение
nmcli device wifi connect "SSID" password "password"
```

**Решение 3:** Проверь VM
- VirtualBox: Настройки → Сеть → Тип подключения: NAT или Сетевой мост
- VMware: Network Adapter → NAT или Bridged

---

### ❌ Нет звука

**Решение:**
```bash
# Проверь PipeWire
systemctl --user status pipewire pipewire-pulse

# Перезапусти
systemctl --user restart pipewire pipewire-pulse wireplumber

# Громкость
wpctl set-volume @DEFAULT_AUDIO_SINK@ 50%

# GUI
pavucontrol
```

---

### ❌ Не работает клавиатура/мышь в VM

**VirtualBox:**
- Установи Guest Additions:
```bash
sudo pacman -S virtualbox-guest-utils
sudo systemctl enable vboxservice
sudo reboot
```

**VMware:**
```bash
sudo pacman -S open-vm-tools
sudo systemctl enable vmtoolsd
sudo reboot
```

---

### ❌ Не переключается раскладка

**Решение:**
```bash
nano ~/.config/hypr/hyprland.conf

# Найди:
input {
    kb_layout = us,ru
    kb_options = grp:alt_shift_toggle
}

# Измени kb_options:
# Alt+Shift:     grp:alt_shift_toggle
# Ctrl+Shift:    grp:ctrl_shift_toggle
# Win+Space:     grp:win_space_toggle
# CapsLock:      grp:caps_toggle
```

---

## Проблемы с производительностью

### 🐌 Медленная работа

**Решение:**
1. Увеличь ресурсы VM:
   - ОЗУ: 8GB
   - CPU: 4 ядра
   - Видео: 256MB

2. Включи ускорение:
   - VirtualBox: 3D acceleration
   - VMware: 3D graphics + 2GB video RAM

3. Уменьши эффекты:
```bash
nano ~/.config/hypr/hyprland.conf

# Отключи анимации:
animations {
    enabled = false
}

# Уменьши размытие:
blur {
    enabled = false
}
```

---

### 🔥 Высокая нагрузка CPU

**Решение:**
```bash
# Проверь процессы
btop

# Убей тяжелые процессы
killall process-name

# Уменьши эффекты (см. выше)
```

---

## Проблемы с приложениями

### ❌ Приложение не запускается

**Решение:**
```bash
# Запусти из терминала для просмотра ошибок
firefox &

# Проверь установлено ли
pacman -Q firefox

# Переустанови
sudo pacman -S --overwrite "*" firefox
```

---

### ❌ Steam не работает

**Решение:**
```bash
# Включи multilib в /etc/pacman.conf
sudo nano /etc/pacman.conf

# Раскомментируй:
[multilib]
Include = /etc/pacman.d/mirrorlist

# Обнови и установи
sudo pacman -Sy
sudo pacman -S steam

# 32-bit драйверы
sudo pacman -S lib32-mesa lib32-vulkan-intel lib32-vulkan-radeon
```

---

### ❌ VS Code не запускается

**Решение:**
```bash
# Проверь AUR
yay -S visual-studio-code-bin

# Или используй OSS версию
sudo pacman -S code

# Запусти с флагами
code --no-sandbox
```

---

## Диагностические команды

### Проверка системы
```bash
# Информация о системе
fastfetch
neofetch

# Журналы
journalctl -b            # Логи текущей загрузки
journalctl -xe           # Последние ошибки
dmesg                    # Kernel messages

# Процессы
ps aux
btop
htop

# Диск
df -h
lsblk

# Сеть
ip a
nmcli device status
ping google.com

# GPU
lspci | grep VGA
glxinfo | grep render

# Службы
systemctl --failed
systemctl status sddm
systemctl status NetworkManager
```

---

## Получение помощи

Если ничего не помогло:

1. **Собери информацию:**
```bash
# Сохрани логи
journalctl -b > ~/boot.log
dmesg > ~/dmesg.log
cat ~/.cache/hyprland/hyprland.log > ~/hyprland.log
```

2. **Создай issue:**
- Опиши проблему
- Приложи логи
- Укажи версию NeetOs
- Опиши конфигурацию VM

3. **Сообщество:**
- Arch Linux Wiki: https://wiki.archlinux.org
- Hyprland Docs: https://wiki.hyprland.org
- Reddit: r/archlinux

---

**Большинство проблем решается перезагрузкой! 🔄**
