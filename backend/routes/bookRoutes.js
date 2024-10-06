const express = require('express');
// const { getBook, getAllBooks } = require('../controllers/bookController');

const router = express.Router();
const Book = require('../models/Book');
// GET all books
router.get('/books', async (req, res) => {
    try {
      const books = await Book.find();
      res.json(books);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  });
  
  // POST a new book
  router.post('/books', async (req, res) => {
    const book = new Book({
      title: req.body.title,
      author: req.body.author,
      image: req.body.image,
      rating: req.body.rating,
      description: req.body.description
    });
  
    try {
      const newBook = await book.save();
      res.status(201).json(newBook);
    } catch (err) {
      res.status(400).json({ message: err.message });
    }
  });
router.get('/', getAllBooks);
router.get('/:id', getBook);

module.exports = router;
