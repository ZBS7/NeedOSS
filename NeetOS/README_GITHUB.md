# 🚀 NeetOs - Сборка через GitHub Actions

## ⚡ Автоматическая сборка в облаке - БЕЗ установки Linux!

---

## 🎯 Что это?

**NeetOs** - кастомный Linux-дистрибутив на базе Arch Linux:
- ✨ Современный Wayland-интерфейс (Hyprland)
- 🎨 Cyberpunk тема с неоновыми акцентами
- 🎮 Gaming-ready (Steam, Wine, Lutris)
- 👨‍💻 Dev-friendly (VS Code, Git, Node.js)
- 🚀 Оптимизирован для VM

---

## 🔥 Как собрать ISO?

### Способ 1: Через GitHub Actions (ПРОЩЕ ВСЕГО!)

1. **Fork** этот репозиторий (кнопка Fork вверху справа)
2. Перейди на вкладку **Actions**
3. Выбери **"Build NeetOs ISO"**
4. Нажми **"Run workflow"** → **"Run workflow"**
5. Подожди 30-40 минут ☕
6. Скачай готовый ISO из **Artifacts**

**Готово!** Никакого Linux не нужно! 🎉

---

### Способ 2: Ручная сборка на Arch Linux

Если у тебя Arch Linux:

```bash
# Установи зависимости
sudo pacman -S archiso git base-devel

# Клонируй репозиторий
git clone https://github.com/твой-username/neetos.git
cd neetos

# Собери ISO
chmod +x build.sh
sudo ./build.sh
```

Результат: `./out/neetos-*.iso`

---

## 📦 Что внутри?

- **WM**: Hyprland (Wayland)
- **Bar**: Waybar
- **Terminal**: Kitty + Zsh + Powerlevel10k
- **Browser**: Firefox
- **Editor**: VS Code + Neovim
- **Gaming**: Steam, Wine, Lutris
- **Files**: Thunar
- **Theme**: Cyberpunk Dark

---

## 🎮 Запуск в VirtualBox

1. Создай VM: Linux → Arch Linux (64-bit)
2. ОЗУ: 4GB+, Видео: 128MB + 3D
3. Подключи скачанный ISO
4. Запусти!
5. Логин: `neet` / `neet`

---

## 📚 Документация

- **[START_BUILD_NOW.txt](START_BUILD_NOW.txt)** - Быстрый старт для GitHub Actions
- **[GITHUB_GUIDE.md](GITHUB_GUIDE.md)** - Подробная инструкция
- **[CUSTOMIZATION.md](CUSTOMIZATION.md)** - Как кастомизировать
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Решение проблем

---

## ⚙️ Кастомизация

Перед сборкой отредактируй:
- `packages.x86_64` - список пакетов
- `configs/hyprland/` - настройки окружения
- `configs/waybar/` - панель задач
- `airootfs/` - файлы системы

Затем запусти сборку снова!

---

## 🆘 Проблемы?

1. **Workflow не появился?**
   - Проверь что папка `.github/workflows/` загрузилась
   - Включи Actions в настройках репозитория

2. **Сборка упала с ошибкой?**
   - Открой failed workflow → job → step
   - Посмотри логи

3. **ISO слишком большой?**
   - Удали ненужные пакеты из `packages.x86_64`
   - Убери gaming-пакеты (steam, wine, lutris)

---

## 📊 Системные требования

**Для GitHub Actions:**
- Аккаунт GitHub (бесплатно)
- 2000 минут/месяц (хватит на ~50 сборок)

**Для запуска ISO:**
- VirtualBox 6.0+ / VMware 15+
- 4GB+ RAM (рекомендуется 8GB)
- 20GB+ диск
- 3D-ускорение

---

## ⌨️ Горячие клавиши

| Клавиши | Действие |
|---------|----------|
| `Super + Enter` | Терминал |
| `Super + D` | Меню приложений |
| `Super + E` | Файловый менеджер |
| `Super + B` | Браузер |
| `Super + Q` | Закрыть окно |
| `Super + 1-9` | Переключить рабочий стол |

---

## 📜 Лицензия

GPL-3.0 - свободно используй, модифицируй и распространяй!

---

## 🌟 Особенности

- ✅ Автоматическая сборка через GitHub Actions
- ✅ Красивая Cyberpunk тема
- ✅ Предустановленный софт
- ✅ Оптимизация для VM
- ✅ Полная кастомизация
- ✅ Подробная документация

---

## 🚀 Начать прямо сейчас!

1. **Fork** этот репозиторий
2. **Actions** → **Build NeetOs ISO** → **Run workflow**
3. **Скачай ISO** и запусти в VirtualBox!

**Вопросы?** Читай [GITHUB_GUIDE.md](GITHUB_GUIDE.md)!

---

**Создано с ❤️ • 2026 • GPL-3.0**
