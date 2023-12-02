import 'package:flutter/material.dart';

class ScreenSize {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static heightPercent(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value / 100;
  }

  static widthPercent(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value / 100;
  }
}
