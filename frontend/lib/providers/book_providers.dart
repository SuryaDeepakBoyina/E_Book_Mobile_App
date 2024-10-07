import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ebook/models/booksdata.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message${statusCode != null ? ' (Status code: $statusCode)' : ''}';
}

class BookProvider with ChangeNotifier {
  List<Booksdata> _books = [];
  List<Booksdata> _popularBooks = [];
  String _bookContent = '';
  String _audioUrl = '';
  bool _isLoading = false;

  List<Booksdata> get books => _books;
  List<Booksdata> get popularBooks => _popularBooks;
  String get bookContent => _bookContent;
  String get audioUrl => _audioUrl;
  bool get isLoading => _isLoading;

  static const String _baseUrl = 'http://localhost:2000'; // Your local backend URL

  Booksdata? _currentBookDetails;
  Booksdata? get currentBookDetails => _currentBookDetails;

   Future<void> fetchBookDetails(String bookId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('http://localhost:2000/$bookId'));
      if (response.statusCode == 200) {
        _currentBookDetails = Booksdata.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load book details');
      }
    } catch (error) {
      print('Error fetching book details: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllBooks() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$_baseUrl/books'));
      final data = await _handleResponse(response);
      _books = (data as List).map((item) => Booksdata.fromJson(item)).toList();
      _popularBooks = _books.where((book) => book.rating > 4).toList(); // Example criteria for popular books
    } on ApiException catch (e) {
      print('API error: $e');
    } catch (e) {
      print('Unexpected error fetching books: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBookContent(String bookId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$_baseUrl/book/$bookId/content'));
      final data = await _handleResponse(response);
      _bookContent = data['content'];
    } on ApiException catch (e) {
      print('API error: $e');
      // You can add more specific error handling here if needed
    } catch (e) {
      print('Unexpected error fetching book content: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAudioUrl(String bookId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$_baseUrl/audio/$bookId'));
      final data = await _handleResponse(response);
      _audioUrl = data['audioUrl'];
    } on ApiException catch (e) {
      print('API error: $e');
      // You can add more specific error handling here if needed
    } catch (e) {
      print('Unexpected error fetching audio URL: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> _handleResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw ApiException('Failed to load data', response.statusCode);
    }
  }
}
