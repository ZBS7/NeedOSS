# Полный список файлов проекта NeetOs

## 📁 Корневые файлы

| Файл | Описание |
|------|----------|
| `README.md` | Главная документация проекта |
| `QUICKSTART.md` | Быстрый старт (3 команды) |
| `INSTALL.md` | Подробная инструкция по установке |
| `BUILD_INSTRUCTIONS.md` | Пошаговое руководство по сборке |
| `CUSTOMIZATION.md` | Руководство по кастомизации |
| `TROUBLESHOOTING.md` | Решение проблем |
| `PROJECT_STRUCTURE.md` | Структура проекта |
| `FILES_SUMMARY.md` | Этот файл |
| `LICENSE` | Лицензия GPL-3.0 |

## 🔧 Скрипты сборки

| Файл | Назначение | Запуск |
|------|-----------|--------|
| `build.sh` | Главный скрипт сборки ISO | `sudo ./build.sh` |
| `check-requirements.sh` | Проверка системных требований | `./check-requirements.sh` |
| `prepare-build.sh` | Подготовка структуры проекта | `./prepare-build.sh` |
| `create-structure.sh` | Создание директорий | `./create-structure.sh` |

## ⚙️ Конфигурация Archiso

| Файл | Описание |
|------|----------|
| `profiledef.sh` | Определение профиля ISO |
| `packages.x86_64` | Список устанавливаемых пакетов |
| `pacman.conf` | Конфигурация пакетного менеджера |

## 🎨 Конфигурации приложений

### Hyprland (оконный менеджер)
```
configs/hyprland/
└── hyprland.conf          # Главный конфиг, горячие клавиши, анимации
```

### Waybar (панель задач)
```
configs/waybar/
├── config                 # Модули и расположение
└── style.css             # Цвета и стили
```

### Kitty (терминал)
```
configs/kitty/
└── kitty.conf            # Шрифты, цвета, прозрачность
```

### Rofi (launcher)
```
configs/rofi/
└── config.rasi           # Тема и поведение меню
```

### SDDM (экран входа)
```
configs/sddm/
└── sddm.conf             # Настройки входа в систему
```

## 📂 Файловая система (airootfs)

### Системные файлы
```
airootfs/etc/
├── hostname              # Имя хоста: neetos
├── hosts                 # Файл hosts
├── locale.conf           # Системная локаль
├── locale.gen            # Генератор локалей
├── vconsole.conf         # Консольные настройки
├── motd                  # Сообщение при входе (ASCII art)
└── issue                 # Сообщение на login screen
```

### Пользовательские настройки
```
airootfs/etc/skel/        # Шаблон для домашней директории
├── .zshrc                # Конфиг Zsh + Oh My Zsh
├── .p10k.zsh             # Конфиг темы Powerlevel10k
├── .gtkrc-2.0            # GTK2 тема
│
└── .config/              # XDG конфигурации
    ├── hypr/             # Hyprland (копируется из configs/)
    ├── waybar/           # Waybar (копируется из configs/)
    ├── kitty/            # Kitty (копируется из configs/)
    ├── rofi/             # Rofi (копируется из configs/)
    │
    ├── dunst/
    │   └── dunstrc       # Конфиг уведомлений
    │
    ├── neofetch/
    │   └── config.conf   # Конфиг системной информации
    │
    ├── gtk-3.0/
    │   └── settings.ini  # GTK3 тема (Arc-Dark)
    │
    ├── gtk-4.0/
    │   └── settings.ini  # GTK4 тема
    │
    └── autostart/
        └── welcome.desktop  # Автозапуск приветствия
```

### Systemd сервисы
```
airootfs/etc/systemd/system/
└── neetos-setup.service  # Сервис первичной настройки
```

### SDDM конфигурация
```
airootfs/etc/sddm.conf.d/
└── sddm.conf             # (копируется из configs/)
```

### Скрипты системы
```
airootfs/usr/local/bin/
├── neetos-setup          # Скрипт первой настройки
└── neetos-welcome        # Приветственное сообщение
```

### Root файлы
```
airootfs/root/
└── .automated_script.sh  # Автоматическая настройка при загрузке
```

### Ресурсы
```
airootfs/usr/share/backgrounds/
└── neetos-wallpaper.jpg  # Обои рабочего стола (добавь свои)
```

## 📊 Статистика проекта

### Количество файлов:
- **Документация**: 9 файлов
- **Скрипты**: 4 файла
- **Конфиги Archiso**: 3 файла
- **Конфиги приложений**: 7 файлов
- **Системные файлы**: 20+ файлов
- **Всего**: ~45 файлов

### Размеры:
- **Исходники проекта**: ~100 KB (текстовые файлы)
- **Рабочая директория**: ~15 GB (временная)
- **Финальный ISO**: ~2.5 GB
- **Установленная система**: ~6-8 GB

## 🔑 Ключевые файлы для редактирования

### Для изменения списка пакетов:
- `packages.x86_64` - добавь или удали пакеты

### Для изменения внешнего вида:
- `configs/hyprland/hyprland.conf` - цвета, анимации, эффекты
- `configs/waybar/style.css` - цвета панели
- `configs/kitty/kitty.conf` - цвета терминала
- `configs/rofi/config.rasi` - цвета меню

### Для изменения поведения:
- `configs/hyprland/hyprland.conf` - горячие клавиши, правила окон
- `configs/waybar/config` - модули панели
- `airootfs/etc/skel/.zshrc` - алиасы, переменные окружения

### Для автозапуска приложений:
- `airootfs/etc/skel/.config/autostart/` - добавь .desktop файлы

### Для системных настроек:
- `airootfs/etc/locale.gen` - языки системы
- `airootfs/etc/hostname` - имя компьютера
- `airootfs/root/.automated_script.sh` - создание пользователей

## 📝 Какие файлы обязательны

### Минимальный набор для сборки:
```
✅ build.sh
✅ profiledef.sh
✅ packages.x86_64
✅ pacman.conf
✅ airootfs/root/.automated_script.sh
```

### Рекомендуемые для полной функциональности:
```
✅ Все конфиги в configs/
✅ Все файлы в airootfs/etc/skel/
✅ Скрипты в airootfs/usr/local/bin/
✅ Системные файлы в airootfs/etc/
```

## 🎯 Файлы для кастомизации

### Легкая кастомизация (не требует пересборки):
После загрузки ISO можно менять файлы в домашней директории:
- `~/.config/hypr/hyprland.conf`
- `~/.config/waybar/config`
- `~/.config/waybar/style.css`
- `~/.config/kitty/kitty.conf`

### Глубокая кастомизация (требует пересборки):
Перед сборкой меняй файлы в проекте:
- `packages.x86_64` - список пакетов
- `airootfs/etc/skel/` - дефолтные настройки
- `configs/` - предустановленные конфиги

## 🚀 Как использовать файлы

### 1. Проверка проекта:
```bash
./check-requirements.sh
```

### 2. Подготовка:
```bash
./prepare-build.sh
```

### 3. Сборка:
```bash
sudo ./build.sh
```

### 4. Результат:
```
out/neetos-YYYY.MM.DD-x86_64.iso
```

## 📖 Дополнительная документация

- **Быстрый старт**: [QUICKSTART.md](QUICKSTART.md)
- **Полная установка**: [INSTALL.md](INSTALL.md)
- **Пошаговая сборка**: [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)
- **Кастомизация**: [CUSTOMIZATION.md](CUSTOMIZATION.md)
- **Решение проблем**: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- **Структура проекта**: [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)

## ✅ Checklist перед сборкой

- [ ] Arch Linux или Arch-based система
- [ ] Установлен `archiso`
- [ ] 20GB+ свободного места
- [ ] Интернет-соединение
- [ ] Все файлы проекта на месте
- [ ] `build.sh` имеет права на выполнение
- [ ] (Опционально) Добавлены свои обои

## 🎨 Кастомизация файлов

### Добавить свои обои:
```bash
cp your-wallpaper.jpg airootfs/usr/share/backgrounds/neetos-wallpaper.jpg
```

### Изменить логотип:
Редактируй ASCII art в:
- `airootfs/etc/motd`
- `airootfs/etc/issue`
- `airootfs/usr/local/bin/neetos-welcome`

### Добавить свои скрипты:
```bash
cp my-script.sh airootfs/usr/local/bin/
chmod +x airootfs/usr/local/bin/my-script.sh
```

### Автозапуск приложения:
Создай `.desktop` файл в:
```bash
airootfs/etc/skel/.config/autostart/myapp.desktop
```

---

**Все файлы готовы к сборке! 🎉**

Следуй [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md) для начала.
