#!/bin/bash

# Отображение кириллицы
export LC_ALL="ru_RU.UTF-8"

# Определение директории скрипта
script_directory=$(dirname "$(realpath "$0")")

# Отметка времени
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Загрузка переменных из файла
source "$script_directory/.path"

# Проверка изменений
changed_files=$(rsync -a --dry-run --itemize-changes "$source_directory" "$backup_directory" | awk '$1 ~ /[*>]/ {print $2}')

if [ -n "$changed_files" ]; then
    # Если есть изменения, копируем файлы и директории
    rsync -a --delete "$source_directory/" "$backup_directory/"
    
    # Логирование измененных файлов и директорий с отметкой времени
    echo "Измененные файлы и директории ($timestamp):" >> "$script_directory/$log_file"
    echo "$changed_files" >> "$script_directory/$log_file"
    echo "-------------------" >> "$script_directory/$log_file"
    
    echo "Резервное копирование выполнено. Измененные файлы и директории сохранены в лог-файле: $script_directory/$log_file"
else
    echo "Нет изменений. Резервное копирование не требуется ($timestamp)."
fi