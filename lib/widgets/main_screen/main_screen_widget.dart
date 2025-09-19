import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentPageIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Главное', style: AppTextStyle.textStyleBlack,)),
    Center(child: Text('Билеты', style: AppTextStyle.textStyleBlack,)),
    Center(child: Text('Моё', style: AppTextStyle.textStyleBlack,)),
    Center(child: Text('Поиск', style: AppTextStyle.textStyleBlack,)),
    Center(child: Text('Профиль', style: AppTextStyle.textStyleBlack,)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorWhite,
      appBar: AppBar(
        title: const Text('Main screen'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (currentPageIndex == index) return;
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.mainColorBlack,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: 'Главное',
            selectedIcon: Icon(
              Icons.home_filled,
              color: AppColors.mainColorDeepOrange,
            ),
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.add_to_photos,
              color: AppColors.mainColorDeepOrange,
            ),
            icon: Icon(Icons.add_to_photos),
            label: 'Билеты',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.bookmarks_outlined,
              color: AppColors.mainColorDeepOrange,
            ),
            icon: Icon(Icons.bookmarks_outlined),
            label: 'Моё',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.search,
              color: AppColors.mainColorDeepOrange,
            ),
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person_add_alt_rounded,
              color: AppColors.mainColorDeepOrange,
            ),
            icon: Icon(Icons.person_add_alt_rounded),
            label: 'Профиль',
          ),
        ],
      ),
      body:
        _widgetOptions
      [currentPageIndex]
    );
  }
}
