import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';


abstract class AppTextStyle {
  static const TextStyle textStyleWhite = TextStyle(fontSize: 15, color: AppColors.mainColorWhite);
  static const TextStyle textStyleBlack = TextStyle(fontSize: 15, color: AppColors.mainColorBlack);
  static const TextStyle textFieldTextStyle = TextStyle(color: Colors.white, fontSize: 18);
  static InputDecoration textFieldDecoration = InputDecoration(
    labelStyle: TextStyle(
      color: AppColors.mainColorWhite,
      fontSize: 17,
    ),
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
      hintStyle: textStyleWhite,
    );
}