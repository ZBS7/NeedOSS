# 🚀 Начни отсюда!

Добро пожаловать в проект **NeetOs** - кастомный Linux-дистрибутив!

---

## ⚡ Самый быстрый путь

### Если у тебя Arch Linux:

```bash
# 1. Установи зависимости
sudo pacman -S archiso git base-devel

# 2. Дай права на выполнение
chmod +x build.sh

# 3. Собери ISO
sudo ./build.sh
```

**Готово!** ISO будет в `./out/neetos-*.iso`

Запусти его в VirtualBox и наслаждайся! 🎉

---

## 📖 Если нужны подробности

### Шаг 1: Прочитай быстрый старт
👉 **[QUICKSTART.md](QUICKSTART.md)** - 5 минут чтения

### Шаг 2: Проверь систему
```bash
./check-requirements.sh
```

### Шаг 3: Следуй инструкции
👉 **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - пошаговое руководство

---

## 📚 Вся документация

| Документ | Для чего |
|----------|----------|
| **[QUICKSTART.md](QUICKSTART.md)** | Быстрый старт за 3 команды |
| **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** | Подробная сборка шаг за шагом |
| **[INSTALL.md](INSTALL.md)** | Установка и запуск в VM |
| **[CUSTOMIZATION.md](CUSTOMIZATION.md)** | Кастомизация внешнего вида |
| **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** | Решение проблем |
| **[COMMANDS_REFERENCE.md](COMMANDS_REFERENCE.md)** | Справочник команд |
| **[PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** | Структура проекта |
| **[FILES_SUMMARY.md](FILES_SUMMARY.md)** | Список всех файлов |

---

## 🎯 Что это за проект?

**NeetOs** - это:
- ✨ Современная Linux-система на базе Arch
- 🎨 Красивый Wayland-интерфейс (Hyprland)
- 🎮 Предустановленный софт для работы и игр
- 🚀 Оптимизация для виртуальных машин
- 🛠️ Полностью кастомизируемая

---

## 🎨 Что внутри?

### Дизайн:
- **Стиль**: Cyberpunk / Cyber-Minimalism
- **Цвета**: Тёмная тема с неоновыми акцентами
- **Эффекты**: Размытие, закругленные углы, анимации

### Софт:
- **Окружение**: Hyprland (Wayland)
- **Терминал**: Kitty + Zsh + Powerlevel10k
- **Браузер**: Firefox
- **Редактор**: VS Code + Neovim
- **Gaming**: Steam, Wine, Lutris
- **И многое другое!**

---

## ⚙️ Системные требования

### Для сборки:
- Arch Linux (хост)
- 20GB места
- 4GB ОЗУ
- Интернет

### Для запуска:
- VirtualBox / VMware
- 4GB+ ОЗУ
- 20GB диск
- 3D-ускорение

---

## 🛠️ Быстрая навигация

### Хочу собрать:
1. Читай [QUICKSTART.md](QUICKSTART.md)
2. Запусти `./check-requirements.sh`
3. Запусти `sudo ./build.sh`

### Хочу кастомизировать:
1. Читай [CUSTOMIZATION.md](CUSTOMIZATION.md)
2. Редактируй файлы в `configs/` и `packages.x86_64`
3. Пересобери: `sudo ./build.sh`

### Проблемы при сборке:
1. Читай [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Или запусти `./check-requirements.sh`

### Как использовать систему:
1. Читай [INSTALL.md](INSTALL.md)
2. И [COMMANDS_REFERENCE.md](COMMANDS_REFERENCE.md)

---

## 📝 Скрипты в проекте

| Скрипт | Что делает |
|--------|-----------|
| `check-requirements.sh` | Проверяет систему перед сборкой |
| `prepare-build.sh` | Подготавливает структуру проекта |
| `build.sh` | **Главный скрипт - собирает ISO** |

---

## 🎓 Как это работает?

1. **Archiso** - инструмент для создания Arch-based дистрибутивов
2. **profiledef.sh** - определяет параметры ISO
3. **packages.x86_64** - список устанавливаемых пакетов
4. **configs/** - конфигурации для Hyprland, Waybar, и т.д.
5. **airootfs/** - файловая система live-системы
6. **build.sh** - собирает всё это в готовый ISO

---

## 🎯 Твой план действий

### Новичок в Linux?
1. Начни с [QUICKSTART.md](QUICKSTART.md)
2. Следуй [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)
3. При проблемах смотри [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

### Опытный пользователь?
1. Кастомизируй [CUSTOMIZATION.md](CUSTOMIZATION.md)
2. Редактируй `packages.x86_64` и конфиги
3. Запусти `sudo ./build.sh`

### Хочешь понять проект?
1. Изучи [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)
2. Читай [FILES_SUMMARY.md](FILES_SUMMARY.md)
3. Смотри исходники в `configs/` и `airootfs/`

---

## 🆘 Нужна помощь?

### Частые вопросы:

**Q: У меня не Arch Linux, что делать?**  
A: Используй Arch в виртуальной машине или WSL2

**Q: Сколько времени займет сборка?**  
A: 20-40 минут, в зависимости от интернета

**Q: Можно ли использовать для повседневной работы?**  
A: Да! Но это live-система, для полноценной работы установи на диск

**Q: Как изменить список программ?**  
A: Редактируй `packages.x86_64` перед сборкой

**Q: Черный экран после загрузки?**  
A: Смотри [TROUBLESHOOTING.md](TROUBLESHOOTING.md#-чёрный-экран-после-загрузки)

---

## ✅ Чеклист перед началом

- [ ] У меня Arch Linux или Arch-based система
- [ ] Есть 20GB+ свободного места
- [ ] Есть интернет-соединение
- [ ] Установлен `archiso`: `sudo pacman -S archiso`
- [ ] Я прочитал [QUICKSTART.md](QUICKSTART.md)

**Всё готово?** Запускай:
```bash
sudo ./build.sh
```

---

## 🎉 После сборки

1. **ISO готов**: `./out/neetos-*.iso`
2. **Создай VM** в VirtualBox
3. **Подключи ISO** и запусти
4. **Логин**: `neet` / `neet`
5. **Наслаждайся!**

---

## 🌟 Фичи NeetOs

- ✨ Wayland с Hyprland
- 🎨 Cyberpunk тема
- 🚀 Быстрая и легкая
- 🎮 Gaming-ready
- 👨‍💻 Dev-friendly
- 🖼️ Красивая Waybar
- ⚡ Zsh + Powerlevel10k
- 📦 Flatpak + Snap
- 🔧 Полностью кастомизируемая

---

## 📌 Важные ссылки

- **Arch Wiki**: https://wiki.archlinux.org
- **Hyprland Docs**: https://wiki.hyprland.org
- **Archiso Docs**: https://wiki.archlinux.org/title/Archiso

---

## 🤝 Вклад

Проект создан для обучения и экспериментов.  
Свободно используй, модифицируй и делись!

**Лицензия**: GPL-3.0 (см. [LICENSE](LICENSE))

---

## 🎊 Поехали!

Готов начать? Вот твои следующие шаги:

```bash
# 1. Проверка
./check-requirements.sh

# 2. Сборка
sudo ./build.sh

# 3. Тест в VM
# Создай VM, подключи ISO, запусти
```

**Время сборки**: ~30 минут  
**Результат**: Полностью рабочая кастомная ОС! 🚀

---

**Удачи! И помни - [TROUBLESHOOTING.md](TROUBLESHOOTING.md) всегда рядом! 😉**
