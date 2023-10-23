const express = require('express')
const router = express.Router()
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Server!');
});
// Middleware
router.use(bodyParser.urlencoded({ extended: true }));
router.use(express.json());

router.get("/:id_user", async (req, res) => {
    /* get the categories data and join to them the progress (the progress is the average of all the progress in this category available in each quiz related to this category). The progress depend also on the user, so we need to pass the user_id in the request */
    const {id_user} = req.params
    const response = await connection.promise().query('SELECT categories.category_id, categories.category_name, categories.category_image, AVG(progress.progress_value) AS category_progress FROM categories LEFT JOIN quiz ON categories.category_id = quiz.category_id LEFT JOIN progress ON quiz.quiz_id = progress.quiz_id WHERE progress.user_id = ? GROUP BY categories.category_id', [id_user]);
    return res.status(200).json(response[0])
})

module.exports = router