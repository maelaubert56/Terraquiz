[![TerraQuiz](https://img.shields.io/badge/TerraQuiz-000000?logo=github&logoColor=ffffff)](https://github.com/maelaubert56/terraquiz/)
[![Maël Aubert](https://img.shields.io/badge/-Maël%20Aubert-181717?&logo=github&logoColor=white)](https://github.com/maelaubert56)
[![Carla Gros-Alcaraz](https://img.shields.io/badge/-Carla%20Gros--Alcaraz-181717?&logo=github&logoColor=white)](https://github.com/deatheaterz77)
# TerraQuiz
TerraQuiz is a quiz game about geography. It is a web application that uses Vue.js and Express.js.

## Features
In TerraQuiz you can:
- [x] Play a fun quiz game about geography
- [x] Choose between lots of different categories
- [x] Choose between different difficulty levels



## Technologies
TerraQuiz is built with:

[![Vue.js](https://img.shields.io/badge/-Vue.js-4FC08D?style=flat-square&logo=vue.js&logoColor=white)](https://vuejs.org/)
[![Node.js](https://img.shields.io/badge/-Node.js-339933?style=flat-square&logo=node.js&logoColor=white)](https://nodejs.org/en/)
[![Express.js](https://img.shields.io/badge/-Express.js-000000?style=flat-square&logo=express&logoColor=white)](https://expressjs.com/)


## Project setup

### Prerequisites
You will need to create a .env file in the client folder with this variable:
- ```VUE_APP_SERVER_API_URL=``` and the url of the server.

You will need to create a .env file in the server folder with theses variable:
- ```SERVER_PORT=``` and the port you want to use.
- ```CLIENT_URL=``` and the url of the client.
- ```DB_HOST=``` and the url of the database.
- ```DB_USER=``` and the username for the database
- ```DB_PWD=``` and the password for the database
- ```DB_NAME=``` and the name of the database
- ```JWT_SECRET=``` and the secret key for the JWT

You will need to create a database using the schema in the ```database``` folder.
### Installation
```
cd client && npm install
cd server && npm install
```
### Compilation
```
npm run client && npm run server
```
