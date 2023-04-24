# README

Данное приложение используется как вариант облачного хранилища, для хранения данных типа docx, xlsx, zip.

Стек используемых технологий:

* Ruby 3.0.4
* Rails 7.0.4
* Postgresql 12
* HTML, SCSS (Bootstrap), шаблонизатор Slim
* Docker-compose

Для запуска проекта локально использовать команды:

* docker-compose build
* docker-compose run web rails db:create
* docker-compose run web rails db:migrate
* docker-compose up

Схема связей в БД:

Сущность "User" соединяется с сущностью "File" связью один ко многим
Сущность "File" соединяется с единственным прикрепленным через active_storage файлом
