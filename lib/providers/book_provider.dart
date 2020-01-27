import 'package:book_scanner/models/book.dart';
import 'package:book_scanner/services/database_service.dart';
import 'package:book_scanner/services/device_service.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  Book _bookSelected;
  List<Book> _books;
  String _isbn;

  String get isbn => _isbn;
  Book get bookSelected => _bookSelected;
  List<Book> get books => _books;

  void setBookSelected(Book book) {
    _bookSelected = book;
    notifyListeners();
  }

  void setIsbn(String isbn) {
    _isbn = isbn;
    notifyListeners();
  }

  void setBooks(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  Future<void> fetchBookDetails() async {
    final book = await DatabaseService.getBook(_isbn);
    setBookSelected(book);
  }

  Future<void> saveFavorite() async {
    if (_bookSelected != null) {
      await DeviceService.saveFavorite(_bookSelected);
    }
  }

  Future<void> getFavorites() async {
    List<Book> books = [];
    List<String> favorites = await DeviceService.getFavorites();

    favorites.forEach((item) {
      books.add(bookFromJson(item));
    });

    setBooks(books);
  }
}
