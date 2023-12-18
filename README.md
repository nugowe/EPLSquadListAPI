![ServiceMesh](https://github.com/nugowe/EPLSquadListAPI/assets/25004712/90792b15-8515-40ee-b740-b4666a7803d1)

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
