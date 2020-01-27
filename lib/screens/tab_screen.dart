import 'package:book_scanner/screens/favorites_screen.dart';
import 'package:book_scanner/screens/scan_book_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static final String routeName = "tab_screen";

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentTabIndex = 0;

  List<Widget> _pages = [
    ScanBookScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Scanner"),
      ),
      body: _pages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text("Scan"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
