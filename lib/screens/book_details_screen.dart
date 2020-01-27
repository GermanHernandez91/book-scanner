import 'package:book_scanner/models/book.dart';
import 'package:book_scanner/providers/book_provider.dart';
import 'package:book_scanner/widgets/alert_widget.dart';
import 'package:book_scanner/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatelessWidget {
  static final String routeName = "book_details_screen";

  _addBookToFavorites(BuildContext context) {
    Provider.of<BookProvider>(context, listen: false).saveFavorite();

    showDialog(
      context: context,
      builder: (_) => AlertWidget(
        title: "Success",
        message: "You've successfully favorited this book",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
          child: FutureBuilder(
            future: Provider.of<BookProvider>(context, listen: false)
                .fetchBookDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingWidget();
              } else {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      "We couldn't get information about this book",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  );
                } else {
                  return Consumer<BookProvider>(
                    builder: (context, model, child) {
                      Book book = model.bookSelected;
                      return _buildBookDetails(book, context);
                    },
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBookDetails(Book book, BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _addBookToFavorites(context),
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 2.0,
                  ),
                ],
                image: DecorationImage(
                  image: CachedNetworkImageProvider(book.cover.large),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text(
                book.authors[0].name,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 5),
              Text(
                "Published at ${book.publishedDate}",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
