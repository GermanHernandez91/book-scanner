import 'dart:convert';

import 'package:book_scanner/models/author.dart';
import 'package:book_scanner/models/cover.dart';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));
String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  final String title;
  final List<Author> authors;
  final Cover cover;
  final String publishedDate;

  Book({
    this.title,
    this.cover,
    this.authors,
    this.publishedDate,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        cover: Cover.fromJson(json["cover"]),
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        publishedDate: json["publish_date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "cover": cover.toJson(),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
      };
}
