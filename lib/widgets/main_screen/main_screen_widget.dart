import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/account_screen.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/main_tab_app_bar.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/main_tab_body.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/navigaiton_destination_data.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/profile_screen.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/search_screen.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/ticket_screen.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentPageIndex = 0;
  int currentSubTabIndex = 0;

  final List<NavigationDestinationData> navData = [
    const NavigationDestinationData(
      icon: Icons.home_filled,
      selectedIcon: Icons.home_filled,
      labelText: 'Главное',
      color: AppColors.mainColorDeepOrange,
    ),
    const NavigationDestinationData(
      icon: Icons.add_to_photos,
      selectedIcon: Icons.add_to_photos,
      labelText: 'Билеты',
      color: AppColors.mainColorDeepOrange,
    ),
    const NavigationDestinationData(
      icon: Icons.bookmarks_outlined,
      selectedIcon: Icons.bookmarks_outlined,
      labelText: 'Моё',
      color: AppColors.mainColorDeepOrange,
    ),
    const NavigationDestinationData(
      icon: Icons.search,
      selectedIcon: Icons.search,
      labelText: 'Поиск',
      color: AppColors.mainColorDeepOrange,
    ),
    const NavigationDestinationData(
      icon: Icons.person_add_alt_rounded,
      selectedIcon: Icons.person_add_alt_rounded,
      labelText: 'Профиль',
      color: AppColors.mainColorDeepOrange,
    ),
  ];

  void _setSubTabIndex(int index) {
    setState(() {
      currentSubTabIndex = index;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    if (currentPageIndex == 0) {
      return MainTabAppBar(
        currentSubTabIndex: currentSubTabIndex,
        onSubTabChanged: _setSubTabIndex,
      );
    } else {
      final title = navData[currentPageIndex].labelText;
      return AppBar(
        title: Text(title, style: const TextStyle(color: AppColors.mainColorWhite)),
      );
    }
  }

  Widget _buildBody() {
    if (currentPageIndex == 0) {
      return MainTabBody(currentSubTabIndex: currentSubTabIndex);
    }

    switch (currentPageIndex) {
      case 1:
        return const TicketsScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const SearchScreen();
      case 4:
        return const AccountScreen();
      default:
        return const Center(
          child: Text('Главное', style: TextStyle(color: AppColors.mainColorBlack)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        indicatorColor: AppColors.mainColorBlack,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
            if (currentPageIndex != 0) currentSubTabIndex = 0; // сброс субвкладки
          });
        },
        destinations: navData
            .map(
              (data) => NavigationDestination(
                icon: Icon(data.icon),
                selectedIcon: Icon(data.selectedIcon, color: data.color),
                label: data.labelText,
              ),
            )
            .toList(),
      ),
      body: _buildBody(),
    );
  }
}