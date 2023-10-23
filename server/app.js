const express = require('express');
const app = express();
const port = 3000;
const cors = require('cors');
require('dotenv').config();

const userRoutes = require('./routes/Users');
const quizRoutes = require('./routes/Quiz');
const categoriesRoute = require('./routes/Categories');

app.use(cors({ origin: process.env.CLIENT_URL, optionsSuccessStatus: 200 }));
app.use(express.json({limit: '50mb'}));

app.use('/users', userRoutes);
app.use('/quiz', quizRoutes);
app.use('/categories', categoriesRoute);

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});