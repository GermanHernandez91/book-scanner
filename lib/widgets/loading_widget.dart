import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  Widget _buildNativeLoading() {
    if (Platform.isIOS) {
      return _buildIosLoading();
    }

    return _buildAndroidLoading();
  }

  Widget _buildAndroidLoading() {
    return CircularProgressIndicator();
  }

  Widget _buildIosLoading() {
    return CupertinoActivityIndicator(
      radius: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildNativeLoading());
  }
}
