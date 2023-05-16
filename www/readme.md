## Использование

```python
install/cli_install.php

Найти $db->query("SET @@session.sql_mode = 'MYSQL40'"); и заменить на $db->query("SET @@session.sql_mode = ''");

install/model/install/install.php

Найти $db->query("SET @@session.sql_mode = 'MYSQL40'"); и заменить на $db->query("SET @@session.sql_mode = ''");
```

В терминале в папке проекта выполняем команды
```python
cd docker_files

docker-compose up
```

1. Переходим по адресу [http://localhost:8001/admin/](http://localhost:8001/admin/)
2. Удаляем весь кэш в разделе Расширения -> Кэш менеджер -> Удалить весь кэш
3. Заходим в раздел Расширения -> Модификаторы и обновляем модификаторы

Если показана подобная ошибка, то переходим в папку system\storage и добавляем папку cache, после чего проделываем действия 2 и 3.
```python
No such file or directory in /var/www/html/system/library/cache/file.php
```

Доступ к БД по адресу [http://localhost:8000/](http://localhost:8000/)\
Сервер: db\
Пользователь: user\
Пароль: test

Все данные хранятся в volumes так что внесенные вручную изменения в бд не будут уходить в гит. Если очень нужно сделать изменения в БД, то либо создаем .sql файл с запросом, либо импортируем файл всей базы и добавляем его в папку db

## Требования
Установленный [Docker](https://docs.docker.com/desktop/) и [Docker Compose](https://docs.docker.com/compose/install/) в Docker Desktop Compose устанавливается по умолчанию
