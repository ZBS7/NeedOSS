# Справочник команд NeetOs

## 🚀 Команды сборки

### Проверка требований
```bash
./check-requirements.sh
```

### Подготовка проекта
```bash
./prepare-build.sh
```

### Сборка ISO
```bash
sudo ./build.sh
```

### Очистка рабочих файлов
```bash
sudo rm -rf work/ out/
```

### Пересборка
```bash
sudo rm -rf work/ out/
sudo ./build.sh
```

---

## 📦 Управление пакетами

### Установка пакетов
```bash
sudo pacman -S package_name
```

### Удаление пакетов
```bash
sudo pacman -R package_name      # Удалить пакет
sudo pacman -Rns package_name    # Удалить со всеми зависимостями
```

### Обновление системы
```bash
sudo pacman -Syu                 # Полное обновление
sudo pacman -Sy                  # Обновить базы данных
```

### Поиск пакетов
```bash
pacman -Ss keyword               # Поиск в репозиториях
pacman -Qs keyword               # Поиск среди установленных
```

### Информация о пакете
```bash
pacman -Si package_name          # Из репозитория
pacman -Qi package_name          # Установленный
```

### Очистка кеша
```bash
sudo pacman -Sc                  # Удалить старые пакеты из кеша
sudo pacman -Scc                 # Полная очистка кеша
```

---

## 🎨 Управление Hyprland

### Перезапуск Hyprland
```bash
# Выйти и войти снова
Super + M

# Или через терминал
hyprctl reload
```

### Проверка конфига
```bash
hyprctl config
```

### Список окон
```bash
hyprctl clients
```

### Мониторы
```bash
hyprctl monitors
```

### Изменить конфиг
```bash
nano ~/.config/hypr/hyprland.conf
```

### Логи Hyprland
```bash
cat ~/.cache/hyprland/hyprland.log
```

---

## 🎯 Управление Waybar

### Запуск Waybar
```bash
waybar &
```

### Перезапуск Waybar
```bash
killall waybar
waybar &
```

### Изменить конфиг
```bash
nano ~/.config/waybar/config      # Модули
nano ~/.config/waybar/style.css   # Стили
```

### Логи Waybar
```bash
waybar -l debug
```

---

## 🖥️ Системные команды

### Информация о системе
```bash
fastfetch                        # Быстрая информация
neofetch                         # Детальная информация
uname -a                         # Информация о ядре
```

### Мониторинг ресурсов
```bash
btop                             # Интерактивный монитор
htop                             # Альтернативный монитор
top                              # Базовый монитор
```

### Дисковое пространство
```bash
df -h                            # Использование дисков
du -sh *                         # Размер директорий
lsblk                            # Список блочных устройств
```

### Процессы
```bash
ps aux                           # Все процессы
ps aux | grep process_name       # Поиск процесса
kill PID                         # Убить процесс по ID
killall process_name             # Убить все процессы по имени
```

### Память
```bash
free -h                          # Использование памяти
```

### Службы systemd
```bash
systemctl status service_name    # Статус службы
sudo systemctl start service     # Запустить службу
sudo systemctl stop service      # Остановить службу
sudo systemctl enable service    # Включить автозапуск
sudo systemctl disable service   # Отключить автозапуск
systemctl --failed               # Неудачные службы
```

### Журналы
```bash
journalctl -b                    # Логи текущей загрузки
journalctl -xe                   # Последние ошибки
journalctl -u service_name       # Логи службы
dmesg                            # Логи ядра
```

---

## 🌐 Сеть

### NetworkManager
```bash
nmtui                            # Текстовый интерфейс
nmcli device status              # Статус устройств
nmcli device wifi list           # Список Wi-Fi
nmcli device wifi connect "SSID" password "password"  # Подключиться
```

### Проверка соединения
```bash
ping google.com                  # Проверка интернета
ip a                             # IP-адреса
ip route                         # Маршруты
```

### Firewall
```bash
sudo systemctl status firewalld  # Статус
sudo firewall-cmd --list-all     # Правила
```

---

## 🎵 Звук

### PipeWire / PulseAudio
```bash
wpctl status                     # Статус аудио
wpctl set-volume @DEFAULT_AUDIO_SINK@ 50%   # Громкость
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle  # Вкл/выкл звук
pavucontrol                      # GUI управление
```

---

## 👤 Пользователи

### Создать пользователя
```bash
sudo useradd -m -G wheel,audio,video -s /bin/zsh username
sudo passwd username
```

### Удалить пользователя
```bash
sudo userdel -r username
```

### Сменить пароль
```bash
passwd                           # Свой пароль
sudo passwd username             # Чужой пароль
```

### Смена пользователя
```bash
su - username                    # Переключиться на пользователя
sudo -i                          # Войти как root
```

---

## 📁 Файловая система

### Навигация
```bash
cd /path/to/dir                  # Перейти в директорию
cd ~                             # Домашняя директория
cd ..                            # Родительская директория
pwd                              # Текущая директория
```

### Просмотр файлов
```bash
ls                               # Список файлов
ls -la                           # Детальный список
tree                             # Древовидная структура
tree -L 2                        # Ограничить глубину
```

### Операции с файлами
```bash
cp source dest                   # Копировать
cp -r dir/ dest/                 # Копировать директорию
mv source dest                   # Переместить/переименовать
rm file                          # Удалить файл
rm -rf dir/                      # Удалить директорию
mkdir dirname                    # Создать директорию
touch filename                   # Создать файл
```

### Просмотр содержимого
```bash
cat file                         # Вывести содержимое
less file                        # Постраничный просмотр
head file                        # Первые 10 строк
tail file                        # Последние 10 строк
tail -f file                     # Следить за изменениями
```

### Поиск
```bash
find / -name filename            # Поиск файла
grep "pattern" file              # Поиск в файле
grep -r "pattern" dir/           # Рекурсивный поиск
```

### Права доступа
```bash
chmod +x file                    # Сделать исполняемым
chmod 755 file                   # Права rwxr-xr-x
chown user:group file            # Сменить владельца
```

---

## 🎮 Gaming

### Steam
```bash
steam                            # Запустить Steam
```

### Lutris
```bash
lutris                           # Запустить Lutris
```

### Wine
```bash
wine program.exe                 # Запустить Windows программу
winetricks                       # Настройка Wine
```

---

## 📝 Редакторы

### Neovim
```bash
nvim filename                    # Открыть файл
nvim .                           # Открыть текущую директорию
```

Команды в nvim:
- `i` - режим вставки
- `Esc` - нормальный режим
- `:w` - сохранить
- `:q` - выйти
- `:wq` - сохранить и выйти
- `:q!` - выйти без сохранения

### Nano
```bash
nano filename                    # Открыть файл
```

Команды:
- `Ctrl+O` - сохранить
- `Ctrl+X` - выйти
- `Ctrl+K` - вырезать строку
- `Ctrl+U` - вставить

### VS Code
```bash
code .                           # Открыть текущую директорию
code filename                    # Открыть файл
```

---

## 🔍 Диагностика

### GPU
```bash
lspci | grep VGA                 # Видеокарта
glxinfo | grep renderer          # OpenGL renderer
```

### CPU
```bash
lscpu                            # Информация о CPU
cat /proc/cpuinfo                # Детальная информация
```

### Модули ядра
```bash
lsmod                            # Загруженные модули
modprobe module_name             # Загрузить модуль
```

### USB устройства
```bash
lsusb                            # Список USB устройств
```

### PCI устройства
```bash
lspci                            # Список PCI устройств
```

---

## 🔧 Разработка

### Git
```bash
git clone url                    # Клонировать репозиторий
git add .                        # Добавить все изменения
git commit -m "message"          # Коммит
git push                         # Отправить на сервер
git pull                         # Получить изменения
git status                       # Статус репозитория
```

### Python
```bash
python script.py                 # Запустить скрипт
pip install package              # Установить пакет
pip list                         # Список пакетов
python -m venv venv              # Создать виртуальное окружение
```

### Node.js
```bash
node script.js                   # Запустить скрипт
npm install package              # Установить пакет
npm list                         # Список пакетов
npm init                         # Создать проект
```

---

## 🖼️ Скриншоты

### Область экрана
```bash
grim -g "$(slurp)" screenshot.png
```

### Весь экран
```bash
grim screenshot.png
```

### С редактором
```bash
grim -g "$(slurp)" - | swappy -f -
```

---

## 🔐 Безопасность

### Обновления безопасности
```bash
sudo pacman -Syu                 # Регулярные обновления
```

### Firewall
```bash
sudo systemctl enable firewalld
sudo systemctl start firewalld
```

### SSH
```bash
ssh user@host                    # Подключиться
ssh-keygen                       # Создать ключ
```

---

## 💡 Полезные алиасы (уже настроены)

```bash
ll          # ls -lah
la          # ls -A
update      # sudo pacman -Syu
install     # sudo pacman -S
remove      # sudo pacman -Rns
search      # pacman -Ss
clean       # sudo pacman -Sc
cls         # clear
vi          # nvim
vim         # nvim
```

---

## 📚 Справка

### Справка по команде
```bash
man command                      # Руководство
command --help                   # Краткая справка
```

### Arch Wiki
```bash
firefox https://wiki.archlinux.org
```

---

**Все основные команды для работы с NeetOs! 🎉**

Для большего: `man command` или `command --help`
