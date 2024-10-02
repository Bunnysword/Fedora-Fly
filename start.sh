#!/bin/bash

echo Добро пожаловать!
echo 1 - полная настройка. 2 - минимальная настройка. 3 - удалить скрипт. 4 - выход.
read -p "Введите число: " number
if (( $(echo "$number == 1" | bc -l) )); then 
    echo "Выбрана полная настройка."
    chmod 750 fedora-fly.sh && ./fedora-fly.sh
elif (( $(echo "$number == 2" | bc -l) )); then 
    echo "Выбрана минимальная настройка"
    chmod 750 mini.sh && ./mini.sh
elif (( $(echo "$number == 3" | bc -l) )); then
    cd .. && rm -rf Fedora-Fly/
    echo Скрипт удалён.
    exit
elif (( $(echo "$number == 4" | bc -l) )); then
    echo Ничего не сделано, выход.
    exit
else
    echo Ничего не сделано, выход.
    exit
fi

echo Конфигурация всех файлов.
chmod 750 configurations.sh && ./configurations.sh

echo Всё готово.
exit
