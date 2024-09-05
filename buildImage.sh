# manda a imagem "db" pro minikube
cd docker-img/database

cp ../../db/MySQL/create.sql .

docker build . -t db

minikube image load db


# manda a imagem "web" pro minikube
cd ../site

cp ../../target/Livraria.war .

docker build . -t web

minikube image load web 



# manda a imagem do nginx para o minikube
cd ../book-covers

cp -r ../../book-covers .

docker build . -t book-covers

minikube image load book-covers