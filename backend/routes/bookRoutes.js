const express = require('express');
const router = express.Router();
const bookController = require('../controllers/bookController');

router.get('/', bookController.getAllBooks);
router.get('/:id', bookController.getBookById);
router.post('/', bookController.createBook);
router.put('/:id', bookController.updateBook);
router.delete('/:id', bookController.deleteBook);

// Add these new routes
router.get('/:id/content', bookController.getBookContent);
router.get('/audio/:id', bookController.getBookAudio);

module.exports = router;
