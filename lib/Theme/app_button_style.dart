import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static ButtonStyle baseStyle = ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    foregroundColor: WidgetStateProperty.all(Colors.black),
    backgroundColor: WidgetStateProperty.all(Colors.white),
    side: WidgetStateProperty.all(const BorderSide(color: Colors.black)),
  );
}
