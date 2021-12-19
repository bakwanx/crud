import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSnackbar{

  static void showNotifSnackBar(String message, GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

}
