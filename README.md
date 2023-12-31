# Мобильная часть решения задачи №4 "Сервис автоматического распределения задач для выездных сотрудников от Совкомбанка". Команда CopyPasteAdapt 
Мобильная часть представлена мобильным приложением, написанным на кроссплатформенном фреймворке Flutter. На данный момент готова версия только для Android, для сборки версии для iOS потребуется внести лишь незначительные доработки.
К репозиторию приложены установочные файлы приложения на Android.

## Структура мобильного приложения
1. Экран авторизации
2. Экран с расписанием выездного сотрудника из которого доступны переходы на следующие экраны:
   - экран с информацией о конкретной задаче, при нажатии на одну из задач в таймлайне
   - экран с информацией о полном маршруте на сегодняшний день при нажатии на кнопку "маршрут"
3. Экран с текущей задачей выездного сотрудника на котором возможно:
   - посмотреть автомобильный маршрут от текущего местоположния до точки назначения
   - посмотреть краткую информацию о текущей задаче
   - подтвердить выполнение задачи
   - указать трудности, возникшие при выполнении задачи, и перенести или же вовсе отменить задачу
4. Экран с рейтингом сотрудника и общим рейтингом города
5. Экран с профилем сотрудника
   - на котором можно выйти из текущего аккаунта пользователя

## Использованные API
1. [Yandex Geocoder](https://yandex.com/maps-api/products/geocoder-api)
2. [Yandex Mapkit SDK](https://yandex.com/maps-api/products/mapkit)
3. [API сервиса, разработанного командой](https://github.com/Jastebsz/CopyPasteAdapt)
