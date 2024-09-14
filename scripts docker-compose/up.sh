cd docker-img/database

cp ../../db/MySQL/create.sql .

docker build . -t db

cd ../site

cp ../../target/Livraria.war .

docker build . -t web

cd ../..

docker compose up