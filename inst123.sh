#!/bin/bash

# URL для использования и логиниться через API сайта Instagram
url = 'httpsNO LINKSapi.instagramNO LINKS/v1/accounts/login/'
# Получить токен для имени пользователя
read -p "Enter the username: " username

# Логиниться в Instagram с помощью API
response=$(curl -s -X POST $url --data "username=$username")

# Получаем пароль из ответа
password=$(echo "$response" | jq '-r .password')

# Проверяем статус ответа
status=$(echo "$response" | jq '-r .status')

# Выводим результат в зависимости от статуса
if [ "$status" = "ok" ]; then
    echo "Password: $password"
else
    echo "Incorrect username!"
fi
