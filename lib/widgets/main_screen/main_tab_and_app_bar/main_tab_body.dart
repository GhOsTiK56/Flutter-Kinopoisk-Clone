import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/my_film_screen/my_films_screen.dart';

class MainTabBody extends StatelessWidget {
  final int currentSubTabIndex;

  const MainTabBody({super.key, required this.currentSubTabIndex});

  static const List<String> subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];

  static final List<Widget> subTabWidgets = [
    Center(child: MyFilmsWidget()),
    Center(child: Text('Детям', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Спорт', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Каналы', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Подписки', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Загрузить', style: AppTextStyle.textStyleWhite)),
  ];

  @override
  Widget build(BuildContext context) {
    return subTabWidgets[currentSubTabIndex];
  }
}

