import 'package:credit_and_conversation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static ShowCustomToast({required String msg, double? fontSize = 16}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: goldenColor,
        textColor: Colors.white,
        fontSize: fontSize);
  }
}
