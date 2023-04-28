# Prolo App backend

## SETUP

Create and start venv and install dependencies
```sh
python -m venv venv
source venv/bin/activate
```
Install dependencies
```sh
pip install -r requirements
```

Setup the DB
```sh
python manage.py makemigrations
python manage.py migrate
python manage.py shell
```
In the python console
```py
import data.parse
data.parse.import_all()
exit()
```
Start server
```sh
python manage.py runserver
```
The server now runs on localhost:8000

## Endpoints
Base url : http://localhost:8000/users_manager/
| TYPE | ENDPOINT | DESCRIPTION |
| ---- | -------- | ----------- |
| GET  | contestant/\<login>| get specific contestant
| POST | setcontestant/\<login> | set contestant score, with score in the request body
| GET  | users_manager/contestants | get all contestants
| GET  | users_manager/houses | get list of houses
| GET  | users_manager/users | get list of users
| GET  | leaderboard | get the users sorted by score and their progress since last checkpoint 

Example post with curl:
```sh
curl -X POST -H "Content-Type: application/json" -d ' {"score": "50"}' http://127.0.0.1:8000/users_manager/setcontestant/taha.amrani/
```