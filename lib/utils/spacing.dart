import 'package:flutter/material.dart';
import 'package:movie_app_animation/utils/screen_size.dart';

class AppSpace {
  static SizedBox hori5 = const SizedBox(
    width: 5,
  );
  static SizedBox hori10 = const SizedBox(
    width: 10,
  );
  static SizedBox hori15 = const SizedBox(
    width: 15,
  );
  static SizedBox hori20 = const SizedBox(
    width: 20,
  );
  static SizedBox vert5 = const SizedBox(
    height: 5,
  );
  static SizedBox vert10 = const SizedBox(
    height: 10,
  );
  static SizedBox vert15 = const SizedBox(
    height: 15,
  );
  static SizedBox vert20 = const SizedBox(
    height: 20,
  );
  static double defaultPadding(context) => ScreenSize.widthPercent(context, 5);
}
