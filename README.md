<h1 align="center">TerraQuiz - The Geography Quiz Game</h1>

<div align="center">

![Vue.js](https://img.shields.io/badge/vue.js-%234FC08D.svg?style=for-the-badge&logo=vue.js&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![MySQL](https://img.shields.io/badge/mysql-%234479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)

</div>
<div align="center">

👉 [terraquiz.maelaubert.fr](https://terraquiz.maelaubert.fr)
</div>
<br>  

> <p align="center">🌍 A fun and interactive quiz game about <strong>geography</strong>, developed during an international semester in Malaysia by <strong>Carla Gros-Alcaraz</strong> and <strong>me</strong>.</p>


<br>

## <h2>🎨 Project Overview</h2>

**TerraQuiz** is a web application that offers an entertaining way to test your geography knowledge. Users can explore different categories and difficulty levels, making learning about the world both fun and challenging.

This project was developed as part of an academic semester in Kuala Lumpur, Malaysia.

<br>

## <h2>🚀 Features</h2>
- 🌐 **Play Geography Quizzes**: Engage in a quiz game focused on geography.
- 🔍 **Category Selection**: Choose from a variety of geographic categories.
- 🌱 **Difficulty Levels**: Customize your quiz experience by selecting different difficulty levels.

<br>

## <h2>🔧 Technologies Used</h2>

- **Frontend**: [Vue.js](https://vuejs.org/) for building the user interface.
- **Backend**: [Node.js](https://nodejs.org/) with [Express](https://expressjs.com/) for the API.
- **Database**: [MySQL](https://www.mysql.com/) for managing quiz questions and user data.

<br>

## <h2>🚪 Project Setup</h2>

### Prerequisites
To set up TerraQuiz, you need to create environment files for both the client and the server.

- **Client (.env)**: Add the following variable:
  
| Variable                 | Description | Default value    |
|--------------------------|-------------|------------------|
| `VUE_APP_SERVER_API_URL` | API URL     | `localhost:3000` |

```env
VUE_APP_SERVER_API_URL=http://localhost:3000
```
<br>

- **Server (.env)**: Add the following variables:

| Variable      | Description                 | Example          |
|---------------|-----------------------------|------------------|
| `SERVER_PORT` | Server port                 | `3000`           |
| `CLIENT_URL`  | URL of the frontend         | `localhost:8080` |
| `DB_HOST`     | Hostname of the MySQL Db    | `localhost`      |
| `DB_USER`     | Username of the MySQL DB    | `user`           |
| `DB_PWD`      | Password of the MySQL DB    | `password`       |
| `DB_NAME`     | Name of the MySQL DB        | `terraquiz_db`   |
| `JWT_SECRET`  | Secret key for the JWT Auth | `secret_key`     |

```env
SERVER_PORT=3000
CLIENT_URL=http://localhost:8080
DB_HOST=localhost
DB_USER=user
DB_PWD=password
DB_NAME=terraquiz_db
JWT_SECRET=secret_key
```

You will also need to create a MySQL database using the schema provided in the `database` folder in the `db&data.sql` file.

<br>

### Installation
To install the project dependencies, run:

```markdown
cd client && npm install
cd server && npm install
```

<br>

### Run the Application
To start both the client and the server, run:

```markdown
npm run all
```

<br>

## <h2>📜 About the Authors</h2>

[![Maël Aubert](https://img.shields.io/badge/-Maël%20Aubert-181717?&logo=github&logoColor=white)](https://github.com/maelaubert56)
[![Carla Gros-Alcaraz](https://img.shields.io/badge/-Carla%20Gros--Alcaraz-181717?&logo=github&logoColor=white)](https://github.com/deatheaterz77)
