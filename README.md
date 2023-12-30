# googledrive-sync-icloud

Возникла необходимость бэкапить данные из гугла в айклауд

Скрипт выполняет проверку изменений в google drive и при наличии выполняет rsync - логируя список измененных файлов

> Несмотря на добавление русской локали - путь с русскими символами отображается криво в логах

```bash
git clone https://github.com/kinematika/googledrive-sync-icloud.git
```

Перед запуском необходимо создать файл .path для указания директорий для работы скрипта
```bash
cd googledrive-sync-icloud
nano .path
# Вставляем содержимое в файл .path
source_directory=/Users/.../CloudStorage/GoogleDrive/
backup_directory=/Users/.../com\~apple\~CloudDocs/
log_file=sync.log
```

Делаем скрипт исполняемым

```bash
chmod +x sync_scrypt.sh
```
Запускаем
```bash
./sync_scrypt.sh
```