require('dotenv').config();
const express = require('express');
const { connectToDatabase } = require('./config/database');
const bookRoutes = require('./routes/bookRoutes');
const errorHandler = require('./utils/errorHandler');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use('/api/books', bookRoutes);
app.use(errorHandler);

connectToDatabase()
  .then(() => {
    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  })
  .catch((error) => {
    console.error('Failed to connect to the database', error);
    process.exit(1);
  });
