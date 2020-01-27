import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanService {
  static Future<String> scan() async {
    try {
      String barcode = await BarcodeScanner.scan();

      return barcode;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        throw Exception("The user did not grant the camera permission");
      } else {
        throw Exception(e.toString());
      }
    } on FormatException {
      throw Exception(
        'null (User returned using the "back"-button before scanning anything. Result)',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
