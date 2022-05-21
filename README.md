# Debuging using Rookout in kubernetes on premise enviorment
This project will use rookout live debuging tool to debug two flask applications.
for on premise k8s cluster we will use docker-desktop k8s cluster.
The build and deployment of aplications would be in gitops percipels using argocd, argoEvents and argoWorkflows.


# Networking
The local cluster will use ngnix controller for external traffic. conroller's service will be expose on 443 using kubectl port-forwd method. 
cert-manager deployet for auto self-signed certificates.

External DNS server will not be used. all domains will be configurated locally in /etc/host and resloved to localhost. by the domain ngnix controller will route to the right service using ingress.

Domains:

webhook.example - used to trigger argoWorkflow in /flaskapp .

webapp.example - rookout's flask application.

datastore.example - external domain for datastore componenet.

controller.example - external domain for controller.

argowf.example - argoWorkflow UI.

flask-app.example - my flask application.

argocd.example - argoCD UI.

# Rookout
For using rookout localy, we will use ETL conroller and datastore. only metadata will pass to rookout cloud and all the information would be stored locally in datastore component. The deployment would be using argoCD application and helm charts. 

![alt text](https://docs.rookout.com/img/screenshots/etl_controller_diagram.png?raw=true "Rookout schem")


Each of flask webapps intiating connection to rookout's ETL controller using SDK. for that purpose the container will be injected with enviorment variables which the process expect. the veriables are: 

ROOKOUT_TOKEN: value manual pre-injected secret (rookout-token) to argocd namespace (key token)

ROOKOUT_CONTROLLER_HOST: ws://rookout-controller.argocd.svc.cluster.local

ROOKOUT_CONTROLLER_PORT: 7488 us the websockt 

ROOKOUT_REMOTE_ORIGIN: each application with it's remote git repo.

# Flask webapplications
I will use to webapplication. 

flask-app: https://github.com/GoshaDo/BestFW

webapp: The dockerfile edited and the repo wasn't forked, those changes was performed to support arm64 chip. base image have been changed to python:3.8-slim and "apt-get install g++ -y " step added. repo: https://github.com/Rookout/tutorial-python




