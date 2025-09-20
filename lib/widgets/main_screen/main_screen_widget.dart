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
  int currentSabTabIndex = 0;

  static const List<String> _subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];
  static const List<Widget> _mainSubTabWidgets = <Widget>[
    Center(child: Text('Моё кино', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Детям', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Спорт', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Каналы', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Подписки', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Загрузить', style: AppTextStyle.textStyleBlack)),
  ];

  Widget? _buildAppBar() {
    switch (currentPageIndex) {
      case 0: // Главное
        return AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.movie,
                  color: AppColors.mainColorDeepOrange,
                ), // лого
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_subTabs.length, (i) {
                      final isSelected = currentSabTabIndex == i;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentSabTabIndex = i;
                            });
                          },
                          child: Text(
                            _subTabs[i],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.mainColorDeepOrange
                                  : Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      case 1: // Билеты
       return AppBar(title: const Text('Билеты'));
      case 2: // Моё
        return AppBar(title: const Text('Моё'));
      case 3: // Поиск
        return AppBar(title: const Text('Поиск'));
      case 4: // Профиль
        return AppBar(title: const Text('Профиль'));
      default:
        return AppBar(
          title: const Text(
            'Kinopoisk Clone',
            style: AppTextStyle.textStyleWhite,
          ),
        );
    }
  }

  Widget _buildBody() {
    if (currentPageIndex == 0) {
      return _mainSubTabWidgets[currentSabTabIndex];
    }
    switch (currentPageIndex) {
      case 1:
        return const Center(child: Text('Билеты'));
      case 2:
        return const Center(child: Text('Моё'));
      case 3:
        return const Center(child: Text('Поиск'));
      case 4:
        return const Center(child: Text('Профиль'));
      default:
        return const Center(child: Text('Главное'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColors.mainColorWhite,
        appBar: _buildAppBar() as PreferredSizeWidget,
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
        body: _buildBody(),
      ),
    );
  }
}
