const mongoose = require('mongoose');

const bookSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  author: {
    type: String,
    required: true
  },
  image: {
    type: String,
    required: true
  },
  rating: {
    type: Number,
    min: 0,
    max: 5,
    default: 0
  },
  description: {
    type: String,
    required: true
  }
}, {
  timestamps: true
});

bookSchema.virtual('url').get(function() {
  return '/book/' + this._id;
});

module.exports = mongoose.model('Book', bookSchema);
