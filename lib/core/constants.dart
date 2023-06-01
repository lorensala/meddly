import 'package:flutter/material.dart';

class Constants {
  static const boxShadow = [
    BoxShadow(
      color: Color.fromARGB(255, 215, 215, 215),
      blurRadius: 6,
      offset: Offset(2, 2),
    ),
  ];

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1, -0.3),
    end: Alignment(1, 0.3),
  );
}
