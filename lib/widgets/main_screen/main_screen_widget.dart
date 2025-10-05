import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Новости'),
    MovieListWidget(),
    Text('Сериалы'),
  ];

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorBlack,
      appBar: AppBar(
        backgroundColor: AppColors.mainColorDarkBlue,
        title: Center(
          child: const Text(
            'Kinopoisk Clone',
            style: TextStyle(color: AppColors.mainColorWhite),
          ),
        ),
      ),
      body: Center(child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Сериалы'),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
