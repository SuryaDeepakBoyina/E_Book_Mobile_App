import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookProvider with ChangeNotifier {
  String _bookContent = '';
  String _audioUrl = '';
  bool _isLoading = false;

  String get bookContent => _bookContent;
  String get audioUrl => _audioUrl;
  bool get isLoading => _isLoading;

  Future<void> fetchBookContent(String bookId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/book/$bookId/content'));
      if (response.statusCode == 200) {
        _bookContent = json.decode(response.body)['content'];
      } else {
        print('Failed to load book content: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching book content: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAudioUrl(String bookId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/audio/$bookId'));
      if (response.statusCode == 200) {
        _audioUrl = json.decode(response.body)['audioUrl'];
      } else {
        print('Failed to load audio URL: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching audio URL: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
