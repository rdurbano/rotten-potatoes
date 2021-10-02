#fazendo o build da imagem
cd src
docker build -t rdurbano/rotten-potatoes:v1 .
docker image ls

docker login 

docker push rdurbano/rotten-potatoes:v1
docker tag rdurbano/rotten-potatoes:v1 rdurbano/rotten-potatoes:latest
docker push rdurbano/rotten-potatoes:latest

#criando o cluster
docker container ls
kind create cluster --name kubcluster --config cluster.yaml

#crinado o deployment
cd ..
cd k8s
kubectl apply -f deployment.yaml

kubectl get services
kubectl get deployment
kubectl get pods
kubectl get nodes
kubectl describe pods/mongodb-89dddc46-5t2rb

kubectl get all

kubectl port-forward svc/mongodb 27017:27017