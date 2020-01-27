import 'package:book_scanner/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceService {
  static setFavoriteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = [];

    prefs.setStringList("favorites", favorites);
  }

  static getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("favorites");
  }

  static saveFavorite(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonBook = bookToJson(book);

    List<String> favorites = prefs.getStringList("favorites");
    favorites.add(jsonBook);

    prefs.setStringList("favorites", favorites);
  }
}
