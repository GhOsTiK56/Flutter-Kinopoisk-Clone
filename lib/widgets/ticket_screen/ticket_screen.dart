import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Билеты', style: TextStyle(color: AppColors.mainColorBlack)));
  }
}