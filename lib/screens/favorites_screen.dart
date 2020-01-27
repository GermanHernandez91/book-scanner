import 'package:book_scanner/models/book.dart';
import 'package:book_scanner/providers/book_provider.dart';
import 'package:book_scanner/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  static final String routeName = "favorites_screen";

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<BookProvider>(context, listen: false).getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          } else {
            return Consumer<BookProvider>(
              builder: (context, model, child) {
                List<Book> books = model.books;
                return _buildFavoriteList(context, books);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildFavoriteList(BuildContext context, List<Book> books) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          Book book = books[index];
          return _buildFavoriteItem(book);
        },
      ),
    );
  }

  Widget _buildFavoriteItem(Book book) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CachedNetworkImage(
            imageUrl: book.cover.small,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text(book.title),
          subtitle: Text(book.authors[0].name),
        ),
        Divider(),
      ],
    );
  }
}
