import 'dart:convert';

import 'package:book_scanner/models/book.dart';
import 'package:http/http.dart' as http;

class DatabaseService {
  static Future<Book> getBook(String isbn) async {
    final isbnFormat = "ISBN:$isbn";
    final url =
        "https://openlibrary.org/api/books?bibkeys=$isbnFormat&format=json&jscmd=data";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Book book;
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      book = Book.fromJson(jsonResponse.values.toList()[0]);

      return book;
    } else {
      throw Exception("Failed fetching book details");
    }
  }
}
