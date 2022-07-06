# Скрипты деплоя фронта и бэка проекта "Метрика"

# Соотвествие веток средам

| Ветка | Среда | Префикс контейнера | Пример |
| ------ | ------ | ------ | ------ |
| master | test | m | m1.0.1 |

# Обновление Test
- Делает Jenkins автоматически, версия берется из Jenkins

# Первый выкат на голый сервер должен быть вручную, версию узнаем в Jenkins

Пример:
  ```sh
    ansible-playbook -i /etc/ansible/metrika/apps/inventories/test/hosts.yaml /etc/ansible/metrika/apps/metrika-service-deployment.yml --extra-vars "version=m1.0.149"
    ansible-playbook -i /etc/ansible/metrika/apps/inventories/test/hosts.yaml /etc/ansible/metrika/apps/metrika-service-front-deployment.yml --extra-vars="version=m1.0.53"
  ```
