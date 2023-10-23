CREATE TABLE users(
   user_id INT AUTO_INCREMENT,
   user_username VARCHAR(50)  NOT NULL,
   user_password VARCHAR(50)  NOT NULL,
   user_pp TINYINT NOT NULL,
   user_privilege TINYINT NOT NULL,
   PRIMARY KEY(user_id),
   UNIQUE(user_username)
);

CREATE TABLE category(
   category_id INT AUTO_INCREMENT,
   category_name VARCHAR(50)  NOT NULL,
   category_image VARCHAR(50)  NOT NULL,
   PRIMARY KEY(category_id)
);

CREATE TABLE quiz(
   quiz_id INT AUTO_INCREMENT,
   quiz_name VARCHAR(50)  NOT NULL,
   quiz_difficulty TINYINT NOT NULL,
   quiz_image TINYINT NOT NULL,
   category_id INT NOT NULL,
   PRIMARY KEY(quiz_id),
   FOREIGN KEY(category_id) REFERENCES category(category_id)
);

CREATE TABLE question_CTF(
   question_CTF_id INT AUTO_INCREMENT,
   question_CTF_flag VARCHAR(50)  NOT NULL,
   question_CTF_answer VARCHAR(50)  NOT NULL,
   question_CTF_bad1 VARCHAR(50)  NOT NULL,
   question_CTF_bad2 VARCHAR(50)  NOT NULL,
   question_CTF_bad3 VARCHAR(50)  NOT NULL,
   quiz_id INT NOT NULL,
   PRIMARY KEY(question_CTF_id),
   FOREIGN KEY(quiz_id) REFERENCES quiz(quiz_id)
);

CREATE TABLE question_WDYS(
   question_WDYS_id INT AUTO_INCREMENT,
   question_WDYS_sentence VARCHAR(50)  NOT NULL,
   question_WDYS_answer VARCHAR(50)  NOT NULL,
   question_WDYS_bad1 VARCHAR(50)  NOT NULL,
   question_WDYS_bad2 VARCHAR(50)  NOT NULL,
   question_WDYS_bad3 VARCHAR(50)  NOT NULL,
   quiz_id INT NOT NULL,
   PRIMARY KEY(question_WDYS_id),
   FOREIGN KEY(quiz_id) REFERENCES quiz(quiz_id)
);

CREATE TABLE progress(
   user_id INT,
   quiz_id INT,
   progress_value DECIMAL(4,0)   NOT NULL,
   PRIMARY KEY(user_id, quiz_id),
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(quiz_id) REFERENCES quiz(quiz_id)
);
