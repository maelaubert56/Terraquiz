const express = require('express')
const router = express.Router()
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Server!');
});
// Middleware
router.use(bodyParser.urlencoded({ extended: true }));
router.use(express.json());

router.get("/", async (req, res) => {
    const response = await db.promise().query('SELECT * FROM users');
    return res.status(200).json(response[0])
})



router.get("/:username", async (req, res) => {
    const {username} = req.params
    db.query('SELECT * FROM users WHERE user_username = ?', [username], (err, result) => {
        if (err) throw err;
        return res.status(200).json(result)
    });
})

router.get("/search/:username", async (req, res) => {
    const {username} = req.params
    db.query('SELECT * FROM users WHERE user_username LIKE ?', ['%' + username + '%'], (err, result) => {
        if (err) throw err;
        return res.status(200).json(result)
    });
})


router.post("/create", async (req, res) => {
    const {username, password, user_pp, privilege} = req.body
    try {
        const response = await db.promise().query('INSERT INTO users (user_username, user_password, user_pp, user_privilege) VALUES (?, ?, ?, ?)', [username, password, parseInt(user_pp), parseInt(privilege)]);
        // when the user is created, we create the progress for each quiz in each category
        // get the id of each quiz
        const id_user = response[0].insertId
        const id_quizzes = await db.promise().query('SELECT quiz_id FROM quiz');
        // for each quiz, we create a progress
       id_quizzes[0].forEach(async (quiz) => {
            await db.promise().query('INSERT INTO progress (user_id, quiz_id, progress_value) VALUES (?, ?, ?)', [id_user, quiz.quiz_id, 0]);
        })

        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.post("/update/:id_user", async (req, res) => {
    const {id_user} = req.params
    const {username, password, avatar} = req.body
    try {
        const response = await db.promise().query('UPDATE users SET user_username = ?, user_password = ?, user_pp = ? WHERE id_user = ?', [username, password, parseInt(avatar), parseInt(id_user)]);
        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.post("/update/privilege/:id_user", async (req, res) => {
    const {id_user} = req.params
    const {privilege} = req.body
    console.log(privilege);
    try {
        const response = await db.promise().query('UPDATE users SET user_privilege = ? WHERE user_id = ?', [parseInt(privilege), parseInt(id_user)]);
        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.post("/delete/:id_user", async (req, res) => {
    const {id_user} = req.params
    try {
        const response = await db.promise().query('DELETE FROM users WHERE user_id = ?', [parseInt(id_user)]);
        console.log(response[0])
        const response1 = await db.promise().query('DELETE FROM progress WHERE user_id = ?', [parseInt(id_user)]);
        console.log(response1[0])

        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})


module.exports = router