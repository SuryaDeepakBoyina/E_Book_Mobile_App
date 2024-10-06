const { client } = require('../config/database');
const { ObjectId } = require('mongodb');

const getBook = async (req, res, next) => {
  try {
    const db = client.db(process.env.DB_NAME);
    const book = await db.collection('books').findOne({ _id: new ObjectId(req.params.id) });
    if (book) {
      res.json(book);
    } else {
      res.status(404).json({ message: 'Book not found' });
    }
  } catch (error) {
    next(error);
  }
};

const getAllBooks = async (req, res, next) => {
  try {
    const db = client.db(process.env.DB_NAME);
    const books = await db.collection('books').find().toArray();
    res.json(books);
  } catch (error) {
    next(error);
  }
};

module.exports = { getBook, getAllBooks };
