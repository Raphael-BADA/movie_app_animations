import 'package:flutter/material.dart';

class Navigation {
  static nextTo(BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
