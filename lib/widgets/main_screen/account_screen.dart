import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Профиль', style: TextStyle(color: AppColors.mainColorBlack)));
  }
}