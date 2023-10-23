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


router.post("/create", async (req, res) => {
    const {username, password, avatar, privilege} = req.body
    console.log(req.body)
    console.log(username, password, avatar, privilege)
    try {
        const response = await db.promise().query('INSERT INTO users (user_username, user_password, user_pp, user_privilege) VALUES (?, ?, ?, ?)', [username, password, parseInt(avatar), parseInt(privilege)]);
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
    try {
        const response = await db.promise().query('UPDATE users SET user_privilege = ? WHERE id_user = ?', [parseInt(privilege), parseInt(id_user)]);
        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.delete("/delete/:id_user", async (req, res) => {
    const {id_user} = req.params
    try {
        const response = await db.promise().query('DELETE FROM users WHERE id_user = ?', [parseInt(id_user)]);
        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})


module.exports = router