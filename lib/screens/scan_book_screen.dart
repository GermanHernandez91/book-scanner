import 'package:book_scanner/providers/book_provider.dart';
import 'package:book_scanner/screens/book_details_screen.dart';
import 'package:book_scanner/services/scan_service.dart';
import 'package:book_scanner/widgets/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanBookScreen extends StatefulWidget {
  @override
  _ScanBookScreenState createState() => _ScanBookScreenState();
}

class _ScanBookScreenState extends State<ScanBookScreen> {
  _scanBook() async {
    try {
      String barcode = await ScanService.scan();
      Provider.of<BookProvider>(context, listen: false).setIsbn(barcode);
      Navigator.pushNamed(context, BookDetailsScreen.routeName);
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertWidget(
          title: "Something went wrong",
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 60,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Start scanning the bar code of any book",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 40),
              ButtonTheme(
                height: 44.0,
                minWidth: 150.0,
                child: RaisedButton(
                  onPressed: _scanBook,
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 8,
                  child: Text("Scan barcode"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
