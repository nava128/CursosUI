import 'package:flutter/material.dart';

class BackgroundBoxDecoration {
  static getBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
      colors: <Color>[
        //Mudou antes aceitava Colors.black
        Color(0xDD000000),
        Color(0xFFF44336),
        Color(0xFFFFE0B2),
        Color(0xFFF57F17),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 1.0),
      stops: [0.0, 0.4, 0.8, 1.0],
      tileMode: TileMode.clamp,
    ));
  }
}
