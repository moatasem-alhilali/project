import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackBarMessage {
  

  static void showAwesomeSnackBar({
    required String message,
    String? title,
    required BuildContext context,
    required ContentType contentType,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      
      content: AwesomeSnackbarContent(
        title: title ?? '',
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
