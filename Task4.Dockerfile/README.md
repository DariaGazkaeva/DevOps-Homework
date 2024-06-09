# Task 4. Dockerfile
### Требования.
- [x] Dockerfile для создания образа, который будет содержать Nginx и Postgres
- [x] Использовать инструкции: FROM, MAINTAINER, RUN, CMD, WORKDIR, ENV, ADD, COPY, VOLUME, USER, EXPOSE
- [x] Dockerfile должен содержать комментарии с пояснениями того, что делается
- [x] Собранный образ должен иметь имя вида <фамилия>_<инициалы>_image_<текущая дата>.
- [x] Скрин со всеми слоями image и их размер на диске + команда для вывода
### Отчет.
Собираем образ с помощью команды ``docker build -t gazkaeva_dv_image_07_06_2024``:  
![build](./screenshots/build.png)  

Запуск:  
![run](./screenshots/run.png)  

Слои и их размер с помощью команды ``docker history gazkaeva_dv_image_07_06_2024``:  
![history](./screenshots/history.png)  

Postgres работает:  
![postgres](./screenshots/postgres.png)  

Nginx работает:  
![nginx](./screenshots/nginx.png)  

И статика тоже выводится:  
![nginx static](./screenshots/static.png)  
