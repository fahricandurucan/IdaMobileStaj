import 'package:flutter/material.dart';

class AppStyles {
  static const Color primaryColor = Color.fromARGB(255, 240, 204, 0);
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const EdgeInsets standardPadding = EdgeInsets.all(16);
  static const BoxShadow buttonShadow = BoxShadow(
    color: Colors.grey,
    offset: Offset(0, 4),
    blurRadius: 6,
  );
}
