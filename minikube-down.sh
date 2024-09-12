# Removendo a configuração do docker do backend 
cd K8s/site

kubectl delete -f deployment.yaml; kubectl delete -f service.yaml;

cd ../..

# Removendo a configuração do docker do nginx
cd K8s/book-covers

kubectl delete -f deployment.yaml; kubectl delete -f service.yaml;

cd ../..

# Removendo a configuração do docker do banco de dados
cd K8s/database

kubectl delete -f deployment.yaml; kubectl delete -f service.yaml;

kubectl delete -f configmap.yaml; kubectl delete -f secret.yaml;

kubectl delete -f pv.yaml; kubectl delete -f pvc.yaml;

cd ../..