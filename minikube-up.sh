# Inicializando o minikube                 
minikube start # --force

# Inicializando o ingress
minikube image load k8s.gcr.io/ingress-nginx/controller:v1.9.4

minikube addons enable ingress

# Inicializando os complementos necessários             
minikube addons enable dashboard

minikube addons enable metrics-server

# Gerando a imagem do docker do banco de dados
cd docker-img/database

cp ../../db/MySQL/create.sql .

docker build . -t db

minikube image load db

# Gerando a imagem do docker do nginx referente a capa dos livros
cd ../book-covers

cp -r ../../book-covers .

docker build . -t capas

minikube image load capas

# Gerando a imagem do docker do backend 
cd ../site

cp ../../target/Livraria.war .

docker build . -t web

minikube image load web 

cd ../..

################# Configurando o K8s
# 1) Banco de dados (db)
cd K8s/database


kubectl create -f pv.yaml; kubectl create -f pvc.yaml;


kubectl apply -f configmap.yaml; kubectl apply -f secret.yaml;

kubectl apply -f deployment.yaml; kubectl apply -f service.yaml;

cd ../..

# 2) Nginx - capa dos livros (book-covers)
cd K8s/book-covers

kubectl apply -f deployment.yaml; kubectl apply -f service.yaml;

cd ../..

# 3) Website - backend (web)
cd K8s/site

kubectl wait --for=jsonpath='{.status.phase}'=Running $(kubectl get pods -o=name)

kubectl apply -f deployment.yaml; kubectl apply -f service.yaml;

cd ../..

kubectl apply -f K8s/ingress.yaml

#deus pq vc e assim cmg
#kubectl delete pv livraria-pv
#cd K8s/database
#kubectl apply -f pv.yaml
#kubectl get pods
#kubectl delete pod <pod do bd>