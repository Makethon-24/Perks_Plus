require('dotenv').config();
const express = require('express');
const mysql = require('mysql');
const bcrypt = require('bcrypt'); 
const app = express();

const db = mysql.createConnection({
  host: 'localhost', 
  user: 'root', 
  password: process.env.MYSQL_PASSWORD, 
});

db.connect((err) => {
  if (err) {
    console.error('Failed to connect to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

app.use(express.json());

app.post('/login', async (req, res) => {
  const { userId, password } = req.body;
  console.log('Received userId', userId); 

  db.query(
    'SELECT password_hash FROM users WHERE userId = ?',
    [userId],
     async (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Database error' });
        return;
      }
      console.log('Results:', results);
      if (results.length === 0) {
        res.status(401).json({ error: 'Invalid userId or password' });
        return;
      }

      const storedHash = results[0].password_hash;
      console.log('Stored hash:', storedHash);
     
      const match = await bcrypt.compare(password, storedHash);
      console.log('Match:', match);
      if (match) {
        res.status(200).json({ message: 'Login successful' });
      } else {
        res.status(401).json({ error: 'Invalid userId or password' });
      }
    }
  );
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
