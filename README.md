# docker_workspace

## Описание
- Данный репозиторий предназначен для поднятия через DOCKER окружения для разработки в PHP.
    - В процессе развертывания поднимаются контейнеры:
      - Nginx
      - PHP
      - MySQL (можно поднять так же postgresql)
      - PhpMyAdmin (хост в ней `mysql`) или Adminer

## Использование
- запустить операцию сборки `/php-build.sh` она создаст файлик `.env`
- заполнить `.env`, особое внимание обратить на свой логин в hub.docker и заполнить переменную `DOCKER_LOGIN`
- запустить еще раз `./php-build.sh` - он соберет php и модули, запакует и выгрузит на ваш акканут в hub.docker
- запустить `./dock-start.sh` - поднимет все инфраструкуру
- остановить - `./dock-stop.sh`
- удалить контейнеры и все волуме (диструктивно!) - `dock-prune.sh`

 ### Создание сертификата
 - Устанавливаем mkcert(https://github.com/FiloSottile/mkcert#installation)
 - Создаем папку или используем proxy/certs и в ней генерируем серфикат
 
 ### [Generate ssl certificate]
 - `mkcert -key-file yournamedomen.key -cert-file yournamedomen.crt yournamedomen`
