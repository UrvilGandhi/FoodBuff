import 'package:flutter/material.dart';

class Toast {

  static void makeText(BuildContext context, String s) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }
}
