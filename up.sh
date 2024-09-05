cd docker-img/database

cp ../../db/MySQL/create.sql .

docker build . -t db

cd ../site

cp ../../target/Livraria.war .

docker build . -t web

cd ../book-covers

cp -r ../../book-covers .

docker build . -t book-covers

cd ../..

docker compose up