const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const BookSchema = new Schema({
  title: { type: String, required: true },
  authorName: { type: String, required: true },
  imagePath: { type: String, required: true },
  percentageCompleted: { type: Number, default: 0 },
  rating: { type: Number, min: 0, max: 5, default: 0 },
  description: { type: String, required: true },
  content: { type: String }, // Add this if you're storing book content
  audioUrl: { type: String } // Add this if you're storing audio URLs
}, { timestamps: true });

// Virtual for book's URL
BookSchema.virtual('url').get(function() {
  return '/catalog/book/' + this._id;
});

module.exports = mongoose.model('Book', BookSchema);
