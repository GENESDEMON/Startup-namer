import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Color(0xFFFFDA05),
        textColor: Color(0xFF226ADB),
        fontSize: 16.0);
  }

  static showRedToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Color(0xFFCB4250),
        textColor: Color(0xFFFFFFFF),
        fontSize: 16.0);
  }
}