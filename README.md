![ServiceMesh](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/90792b15-8515-40ee-b740-b4666a7803d1)

KUBECTL := microk8s.kubectl
WORK_DIR := ~/MYPROJECTS/EPLPROJECTS/EPL-API/src-kubernetes/
DJANGO_WORK_DIR := ~/MYPROJECTS/EPLPROJECTS/EPL-API/core/

.PHONY: DEPLOY-PROMETHEUS
DEPLOY-PROMETHEUS:
	@echo "ENABLING OBSERVABILITY ADDON FOR THIS MICROK8S CLUSTER..."
	microk8s enable prometheus

.PHONY: DEPLOY-METALLB
DEPLOY-METALLB:
	@echo "ENABLING LOADBALANCER ADDON METALLB FOR THIS MICROK8S CLUSTER..."
	microk8s enable metallb

.PHONY: DEPLOY-ISTIOBASE
DEPLOY-ISTIOBASE:
	@echo "DEPLOYING ISTIO BASE ON TO THE MICROK8S CLUSTER..."
	bash $(WORK_DIR)istio/ISTIO_BASE_DEPLOY.sh  
	

.PHONY: DEPLOY-ISTIOGATEWAY
DEPLOY-ISTIOGATEWAY:
	@echo "DEPLOYING ISTIO GATEWAY ON TO THE MICROK8S CLUSTER..."
	bash $(WORK_DIR)istio/istio-gateway/ISTIO_GATEWAY_DEPLOY.sh  


.PHONY: DEPLOY-EPLAPP-MICROK8S
DEPLOY-EPLAPP-MICROK8S:
	@echo "DEPLOYING THE EPL API APPLICATION FROM THE MICROK8S CLUSTER"
	$(KUBECTL) apply -f $(WORK_DIR)templates/client.yaml
	$(KUBECTL) apply -f $(WORK_DIR)templates/deployment.yaml
	$(KUBECTL) apply -f $(WORK_DIR)templates/namespace.yaml
	$(KUBECTL) apply -f $(WORK_DIR)templates/service.yaml
	$(KUBECTL) apply -f $(WORK_DIR)templates/virtual-service.yaml

	
.PHONY: DEPLOY-SERVICEMONITOR
DEPLOY-SERVICEMONITOR:
	@echo "DEPLOYING THE SERVICE MONITOR TO MONITOR THE APP'S ENDPOINTS"
	microk8s kubectl apply -f $(WORKING_DIRECTORY)istio/service-monitor.yaml


.PHONY: DEPLOY-EPLAPP-MICROK8S-DJANGO
DEPLOY-EPLAPP-MICROK8S-DJANGO:
	@echo "RUNNING THE DJANGO EPL API APPLICATION DIRECTLY FROM THE DJANGO WEB SERVER.."
	python3 $(DJANGO_WORK_DIR)manage.py runserver 0.0.0.0:1212


[Screencast from 2023-12-17 22-50-43.webm](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/faffab50-cee1-4391-b0b0-2ed3f17cbd01)

### USAGE INSTRUCTIONS:

## DEPLOYMENT VIA DJANGO NINJA DIRECTLY

python3 $(PWD)/EPL-API/core/manage.py runserver 0.0.0.0:1212

## DEPLOYMENT VIA KUBERNETES CLUSTER

1) Ensure you modify the WORK_DIR Variable to suit your LAPTOP or PC FOLDER STRUCTURE
2) Run the makefile from top to bottom ( I am using microk8s so some of the commands may not be applicable to what you have)

## LAUNCH ON A WEB BROWSER

## LIST OF TEAMS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist

## LIST OF EVERTON PLAYERS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist?Team="Everton"

## LIST OF MANCHESTERCITY PLAYERS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist?Team="ManchesterCity"

## LIST OF DEFENDERS PLAYING IN THE 2023/2024 SEASON

http://localhost:1212/epl/playerlist?Position="DF"
