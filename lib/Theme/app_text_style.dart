import 'package:flutter/material.dart';


abstract class AppTextStyle {
  static const TextStyle textStyle = TextStyle(fontSize: 15, color: Colors.white);
  static const TextStyle textFieldTextStyle = TextStyle(color: Colors.white, fontSize: 18);

  static InputDecoration textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 54, 54, 54)),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      hintStyle: textStyle,
    );
}