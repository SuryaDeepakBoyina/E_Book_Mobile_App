class Booksdata {
  String? id;  // Add this line
  String title;
  String authorName;
  String imagePath;
  int percentageCompleted;
  double rating;
  String description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? content;
  String? audioUrl;
  
  void updateContent(String newContent) {
    content = newContent;
  }
  
  void updateAudioUrl(String newAudioUrl) {
    audioUrl = newAudioUrl;
  }
  

  Booksdata({
    this.id,  // Add this line
    required this.title,
    required this.authorName,
    required this.imagePath,
    required this.percentageCompleted,
    required this.rating,
    required this.description,
    this.createdAt,
    this.updatedAt, 
    this.audioUrl, 
    this.content
  }):assert(percentageCompleted >= 0 && percentageCompleted <= 100),
     assert(rating >= 0 && rating <= 5);

  factory Booksdata.fromJson(Map<String, dynamic> json) {
    return Booksdata(
      id: json['_id'],  // Map '_id' to 'id'
      title: json['title'],
      authorName: json['authorName'],
      imagePath: json['imagePath'],
      percentageCompleted: json['percentageCompleted'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      description: json['description'],
      content: json['content'],
      audioUrl: json['audioUrl'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,  // Include 'id' in the JSON output
      'title': title,
      'authorName': authorName,
      'imagePath': imagePath,
      'percentageCompleted': percentageCompleted,
      'rating': rating,
      'description': description,
      'content': content,
      'audioUrl': audioUrl,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

List<Booksdata> continueReading = [
  Booksdata(
    title: "Wings of Fire",
    authorName: "APJ Abdul Kalam",
    percentageCompleted: 64,
    imagePath: 'assets/images/APJ.jpg',
    rating: 4.5,
    description: "An autobiography of APJ Abdul Kalam, former President of India.",
  ),
  Booksdata(
    title: "The Arsonist",
    authorName: "Chloe Hooper",
    percentageCompleted: 16,
    imagePath: 'assets/images/ChloeHooper.jpg',
    rating: 4.2,
    description: "A powerful real-life thriller about an arsonist and the man who pursued him.",
  ),
  Booksdata(
    title: "Harry Potter",
    authorName: "J.K Rowling",
    percentageCompleted: 44,
    imagePath: 'assets/images/HarryPotter.jpeg',
    rating: 4.8,
    description: "The story of a young wizard and his adventures at Hogwarts School of Witchcraft and Wizardry.",
  ),
];