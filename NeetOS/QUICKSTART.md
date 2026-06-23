# NeetOs - Быстрый старт

## ⚡ Экспресс-сборка (3 команды)

```bash
# 1. Установить зависимости
sudo pacman -S archiso git base-devel

# 2. Дать права на выполнение
chmod +x build.sh

# 3. Собрать ISO
sudo ./build.sh
```

Готово! ISO в `./out/neetos-*.iso`

---

## 🖥️ Запуск в VirtualBox

```bash
# Создай VM:
- Linux / Arch Linux 64-bit
- ОЗУ: 4GB+
- Видео: 128MB, 3D включено
- Подключи ISO

# Запусти VM
```

**Логин:** `neet` / `neet`

---

## ⌨️ Основные горячие клавиши

| Клавиши | Действие |
|---------|----------|
| `Super + Enter` | Терминал |
| `Super + D` | Меню приложений |
| `Super + E` | Файлы |
| `Super + B` | Браузер |
| `Super + Q` | Закрыть окно |
| `Super + 1-9` | Рабочие столы |

---

## 📦 Установка софта

```bash
# Обычные пакеты
sudo pacman -S package_name

# Обновление системы
sudo pacman -Syu

# Поиск
pacman -Ss keyword
```

---

## 🎨 Быстрая кастомизация

### Изменить обои:
```bash
nano ~/.config/hypr/hyprland.conf
# Найди строку с swaybg и измени путь к изображению
```

### Изменить тему терминала:
```bash
nano ~/.config/kitty/kitty.conf
```

### Изменить панель:
```bash
nano ~/.config/waybar/style.css
```

---

## 🔧 Решение проблем

### Чёрный экран?
```bash
Ctrl + Alt + F2  # TTY
Login: neet / neet
sudo systemctl restart sddm
```

### Нет интернета?
```bash
nmtui  # Текстовый менеджер сети
```

### Hyprland не запускается?
```bash
cat ~/.cache/hyprland/hyprland.log
```

---

## 📚 Полная документация

- [README.md](README.md) - Обзор проекта
- [INSTALL.md](INSTALL.md) - Детальная установка
- [CUSTOMIZATION.md](CUSTOMIZATION.md) - Кастомизация

---

## 🚀 Системные требования

**Для сборки:**
- Arch Linux (хост)
- 20GB свободного места
- 4GB ОЗУ
- Интернет

**Для запуска:**
- VirtualBox 6.0+ / VMware 15+
- 4GB ОЗУ (рекомендуется 8GB)
- 20GB диск
- 3D-ускорение включено

---

**Приятного использования! 🎉**
