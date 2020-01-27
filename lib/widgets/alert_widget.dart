import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String title;
  final String message;

  AlertWidget({this.title, this.message});

  Widget _buildNativeAlert(BuildContext context) {
    if (Platform.isIOS) {
      return _buildIosAlert(context);
    }

    return _buildAndroidAlert(context);
  }

  _buildIosAlert(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(this.title),
      content: Text(this.message),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('Dismiss'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  _buildAndroidAlert(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.message),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNativeAlert(context);
  }
}
