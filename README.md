![ServiceMesh](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/90792b15-8515-40ee-b740-b4666a7803d1)

[Screencast from 2023-12-17 22-50-43.webm](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/faffab50-cee1-4391-b0b0-2ed3f17cbd01)

# USAGE INSRUCTIONS FOR THE APPLICATION.

Simply navigate within your terminal to the location where the makefile resides and run the commands below:

## Deploy Prometheus

make DEPLOY-PROMETHEUS

## Deploy metallb

make DEPLOY-METALLB

## Deploy Istiobase 

make DEPLOY-ISTIOBASE

## Deploy Istiogateway

make DEPLOY-ISTIOGATEWAY

## Deploy THE EPL API APPLICATION FROM THE MICROK8S CLUSTER

make DEPLOY-EPLAPP-MICROK8S

## Deploy Prometheus Service Monitor

make DEPLOY-SERVICEMONITOR

## DEPLOY THE EPL API APPLICATION DIRECTLY FROM DJANGO NINJA 

make DEPLOY-EPLAPP-DJANGO-NINJA

## LAUNCH ON A WEB BROWSER

## LIST OF TEAMS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist

# HOW TO QUERY THE API FOR DATA.

## LIST OF EVERTON PLAYERS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist?Team="Everton"

## LIST OF MANCHESTERCITY PLAYERS PLAYING IN THE 2023/2024 Season

http://localhost:1212/epl/playerlist?Team="ManchesterCity"

## LIST OF DEFENDERS PLAYING IN THE 2023/2024 SEASON

http://localhost:1212/epl/playerlist?Position="DF"


[Screencast from 2023-12-17 22-50-43.webm](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/faffab50-cee1-4391-b0b0-2ed3f17cbd01)



