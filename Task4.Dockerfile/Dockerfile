# Создаем базовый образ на основе образа Postgres 16
FROM postgres:16

# Указываем автора
MAINTAINER "Daria Gazkaeva d.gazkaeva@gmail.com"

# Задаем пользователя для выполнения команд
USER root

# Устанавливаем рабочий каталог контейнера
WORKDIR /usr/share/nginx/html

# Устанавливаем переменные среды
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

# Обновляем индекс пакетов и устанавливаем Nginx
RUN apt-get update && apt install -y nginx

# Удаляем все файлы из указанного каталога, чтобы предотвратить конфликты
RUN rm -rf /etc/nginx/sites-enabled

# Копируем файлы конфигурации Nginx в указанный каталог
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Копируем каталог со статикой в рабочий каталог
COPY static .

# Добавляем html файл в рабочий каталог
ADD index.html .

# Монтируем указанные каталоги как тома для хранения данных
VOLUME /usr/share/nginx/html
VOLUME /var/lib/postgresql/data

# Указываем какие порты контейнер будет прослушивать (80 HTTP, 5432 Postgres)
EXPOSE 80
EXPOSE 5432

# Устанавливаем команду, которая запустится после запуска контейнера
# Команда запустит Nginx и Postgres с помощью скрипта docker-entrypoint.sh
CMD ["bash", "-c", "service nginx start && /usr/local/bin/docker-entrypoint.sh postgres"]
