const express = require('express');
const app = express();
require('dotenv').config();
const port = process.env.SERVER_PORT;
const cors = require('cors');
const cookieParser = require("cookie-parser")
const mysql = require('mysql2');
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME
});

// print all the requests
app.use((req, res, next) => {
    console.log('Time:', Date.now());
    console.log(req.method, req.url);
    next();
});

app.use(cookieParser());

const userRoutes = require('./routes/Users');
const quizRoutes = require('./routes/Quiz');
const categoriesRoute = require('./routes/Categories');

app.use(cors({ origin: process.env.CLIENT_URL, optionsSuccessStatus: 200, credentials: true }));
app.use(express.json({limit: '50mb'}));

app.use('/users', userRoutes);
app.use('/quiz', quizRoutes);
app.use('/categories', categoriesRoute);

app.get("/stats", async (req, res) => {
    // return the number of registered and the number of quizzes answered ( by checking how many are not at 0 progression)
    const response = await db.promise().query('SELECT COUNT(*) FROM users');
    const response2 = await db.promise().query('SELECT COUNT(*) FROM progress WHERE progress_value > 0');
    return res.status(200).json({nb_registered: response[0][0]['COUNT(*)'],
        nb_quizzes_answered: response2[0][0]['COUNT(*)']})
})

app.listen(port, () => {
    console.log(`Server is running at port:${port}`);
});