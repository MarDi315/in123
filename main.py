import requests

# URL для использования и логиниться через API сайта Instagram
url = 'https://api.instagram.com/v1/accounts/login/'

# Получить токен для имени пользователя
username = input("Enter the username: ")

# Логиниться в Instagram с помощью API
response = requests.post(url, data={'username': username})

# Находим JSON в ответе
json_data = response.json()

# Если имя пользователя правильное, пароль будет включен в ответ.
if json_data['status'] == 'ok':
    print("Password: " + json_data['password'])

else:
    print("Incorrect username!")
