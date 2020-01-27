import 'package:book_scanner/screens/tab_screen.dart';
import 'package:book_scanner/services/device_service.dart';
import 'package:book_scanner/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashScreen> {
  _setFavoriteList() async {
    List<String> favorites = await DeviceService.getFavorites();

    if (favorites == null) {
      DeviceService.setFavoriteList();
    }

    Navigator.pushReplacementNamed(context, TabScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _setFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget(),
    );
  }
}
