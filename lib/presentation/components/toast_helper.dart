import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ToastHelper {
  /// Show a success message
  static void success(BuildContext context, String message) {
    _showFlushbar(
      context,
      message,
      "Success",
      Colors.white,
      Icons.check_circle,
    );
  }

  /// Show an error message
  static void error(BuildContext context, String message) {
    _showFlushbar(
      context,
      message,
      "Error",
      Colors.black,
      Icons.error,
    );
  }

  /// Show an info message
  static void info(BuildContext context, String message) {
    _showFlushbar(
      context,
      message,
      "Info",
      Colors.blue,
      Icons.info,
    );
  }

  /// Internal reusable method
  static void _showFlushbar(
      BuildContext context,
      String message,
      String title,
      Color color,
      IconData icon,
      ) {
    Flushbar(
      title: title,
      flushbarPosition: FlushbarPosition.TOP,
      titleColor: Colors.white,
      titleSize: 16,
      messageSize: 12,
      messageColor: Colors.white,
      message: message,
      icon: Icon(icon, color: Colors.white),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: Colors.black,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}
