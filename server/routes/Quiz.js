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


/*
quiz_id INT AUTO_INCREMENT,
quiz_name VARCHAR(50)  NOT NULL,
quiz_difficulty TINYINT NOT NULL,
quiz_image TINYINT NOT NULL,
category_id INT NOT NULL,
 */

/*
user_id INT,
quiz_id INT,
progress_value DECIMAL(4,0)   NOT NULL,
 */

router.get("/:id_quiz", async (req, res) => {
    const {id_quiz} = req.params
    const response = await connection.promise().query('SELECT * FROM quiz WHERE quiz_id = ?', [id_quiz]);
    return res.status(200).json(response[0][0])
})

router.get("/:id_quiz/:id_user", async (req, res) => {
    const {id_quiz, id_user} = req.params
    const response = await connection.promise().query('SELECT * FROM progress WHERE quiz_id = ? AND user_id = ?', [id_quiz, id_user]);
    return res.status(200).json(response[0][0])
})

router.get("/category/:id_category/:id_user", async (req, res) => {
    const {id_category, id_user} = req.params
    const response = await connection.promise().query('SELECT quiz.quiz_id, quiz.quiz_name, quiz.quiz_difficulty, quiz.quiz_image, progress.progress_value FROM quiz LEFT JOIN progress ON quiz.quiz_id = progress.quiz_id WHERE quiz.category_id = ? AND progress.user_id = ?', [id_category, id_user]);
    return res.status(200).json(response[0])
})

module.exports = router

