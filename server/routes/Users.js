const express = require('express')
const router = express.Router()
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();
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

function generateToken(username) {
    const payload = { username };
    const options = { expiresIn: '1h'}
    return jwt.sign(payload, process.env.JWT_SECRET, options);
}

function verifyToken(token){
    try{
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        return decoded.username;
    } catch(err){
        return null; // invalid token or expired token
    }
}

router.get("/", async (req, res) => {
    const response = await db.promise().query('SELECT * FROM users');
    return res.status(200).json(response[0])
})

router.get("/scoreboard", async (req, res) => {
  const response = await db.promise().query(
'SELECT users.user_id, user_username, user_pp, AVG(progress_value) as score' +
    'FROM progress' +
    'JOIN users ON progress.user_id = users.user_id' +
    'GROUP BY user_username' +
    'ORDER BY score DESC' +
    'LIMIT 10');
  return res.status(200).json(response[0])
});

router.get("/get/:username", async (req, res) => {
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

router.get("/checkConnection", async (req, res) => {
    try{
        const token = req.cookies.token;
        if (!token) {
            return res.status(401).json({error: "No token found"})
        }
        const username = verifyToken(token);
        if (!username) {
            res.clearCookie('token');
            return res.status(401).json({error: "Invalid token"})
        }
        const response = await db.promise().query('SELECT * FROM users WHERE user_username = ?', [username]);
        if (response[0].length === 0) {
            res.clearCookie('token');
            return res.status(401).json({error: "User not found"})
        }
        return res.status(200).json(response[0][0])
    } catch(err){
        return res.status(401).json({error: "Invalid token"})
    }
})

router.post("/create", async (req, res) => {
    const {username, password, user_pp} = req.body

    const response = await db.promise().query('SELECT * FROM users WHERE user_username = ?', [username]);
    if (response[0].length > 0) {
        return res.status(401).json({error: "User already exists"})
    }
    try {
        const salt = await bcrypt.genSalt();
        const hashedPassword = await bcrypt.hash(password, salt);
        const response = await db.promise().query('INSERT INTO users (user_username, user_password, user_pp, user_privilege) VALUES (?, ?, ?, ?)', [username, hashedPassword, parseInt(user_pp), '0']);
        const token = generateToken(username);
        const id_user = response[0].insertId
        const id_quizzes = await db.promise().query('SELECT quiz_id FROM quiz');
        // for each quiz, we create a progress
         id_quizzes[0].forEach(async (quiz) => {
            await db.promise().query('INSERT INTO progress (user_id, quiz_id, progress_value) VALUES (?, ?, ?)', [id_user, quiz.quiz_id, 0]);
        })
        res.cookie('token', token, { httpOnly: true});
        return res.status(200).json(response[0])
    } catch (err) {
        return res.status(400).json(err)
    }
})

router.post("/login", async (req, res) => {
    const {username, password} = req.body
    try {
        const response = await db.promise().query('SELECT * FROM users WHERE user_username = ?', [username]);
        if (response[0].length === 0) {
            return res.status(401).json({error: "User does not exist"})
        }
        const user = response[0][0]
        const auth = await bcrypt.compare(password, user.user_password);
        if (auth) {
            const token = generateToken(username);
            res.cookie('token', token, {httpOnly: true});
            return res.status(200).json(response[0][0])
        }
        else {
            return res.status(401).json({error: "Wrong password"})
        }
    } catch (err) {
        return res.status(400).json(err)
    }
});

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
        const response = await db.promise().query('UPDATE users SET user_privilege = ? WHERE user_id = ?', [parseInt(privilege), parseInt(id_user)]);
        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.post("/update/password/:id_user", async (req, res) => {
    const {id_user} = req.params
    const {password} = req.body
    try {
        const salt = await bcrypt.genSalt();
        const hashedPassword = await bcrypt.hash(password, salt);
        const response = await db.promise().query('UPDATE users SET user_password = ? WHERE user_id = ?', [hashedPassword, parseInt(id_user)]);
        res.clearCookie('token');
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
        const response1 = await db.promise().query('DELETE FROM progress WHERE user_id = ?', [parseInt(id_user)]);

        return res.status(200).json(response[0])
    }
    catch (err) {
        return res.status(400).json(err)
    }
})

router.delete("/logout", (req, res) => {
    res.clearCookie('token');
    return res.status(200).json({message: "User logged out"})
})

module.exports = router