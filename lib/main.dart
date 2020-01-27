import 'package:book_scanner/providers/book_provider.dart';
import 'package:book_scanner/screens/book_details_screen.dart';
import 'package:book_scanner/screens/favorites_screen.dart';
import 'package:book_scanner/screens/splash_screen.dart';
import 'package:book_scanner/screens/tab_screen.dart';
import 'package:book_scanner/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookProvider(),
      child: MaterialApp(
        title: 'BookScanner',
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        home: SplashScreen(),
        routes: {
          TabScreen.routeName: (_) => TabScreen(),
          BookDetailsScreen.routeName: (_) => BookDetailsScreen(),
          FavoritesScreen.routeName: (_) => FavoritesScreen(),
        },
      ),
    );
  }
}
