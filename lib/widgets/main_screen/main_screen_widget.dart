import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kinopoisk Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainColorBlack,
        ),
        scaffoldBackgroundColor: AppColors.mainColorBlack,
      ),
      home: const MainScreenWidget(),
    );
  }
}

// ------------------------- MAIN SCREEN -------------------------
class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentPageIndex = 0;
  int currentSubTabIndex = 0;

  static const List<String> _subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];

  static const List<Widget> _subTabWidgets = [
    Center(child: Text('Моё кино', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Детям', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Спорт', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Каналы', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Подписки', style: AppTextStyle.textStyleBlack)),
    Center(child: Text('Загрузить', style: AppTextStyle.textStyleBlack)),
  ];

  final List<NavigationDestinatioinData> navData = [
    NavigationDestinatioinData(
      icon: Icons.home_filled,
      selectedIcon: Icons.home_filled,
      labelText: 'Главное',
      color: AppColors.mainColorDeepOrange,
    ),
    NavigationDestinatioinData(
      icon: Icons.add_to_photos,
      selectedIcon: Icons.add_to_photos,
      labelText: 'Билеты',
      color: AppColors.mainColorDeepOrange,
    ),
    NavigationDestinatioinData(
      icon: Icons.bookmarks_outlined,
      selectedIcon: Icons.bookmarks_outlined,
      labelText: 'Моё',
      color: AppColors.mainColorDeepOrange,
    ),
    NavigationDestinatioinData(
      icon: Icons.search,
      selectedIcon: Icons.search,
      labelText: 'Поиск',
      color: AppColors.mainColorDeepOrange,
    ),
    NavigationDestinatioinData(
      icon: Icons.person_add_alt_rounded,
      selectedIcon: Icons.person_add_alt_rounded,
      labelText: 'Профиль',
      color: AppColors.mainColorDeepOrange,
    ),
  ];

  PreferredSizeWidget _buildAppBar() {
    if (currentPageIndex == 0) {
      // Главная вкладка с подтабами
      return AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.movie, color: AppColors.mainColorDeepOrange),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_subTabs.length, (i) {
                    final isSelected = currentSubTabIndex == i;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSubTabIndex = i;
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
    } else {
      // Остальные вкладки
      String title = navData[currentPageIndex].labelText;
      return AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.mainColorWhite),
        ),
      );
    }
  }

  Widget _buildBody() {
    if (currentPageIndex == 0) {
      return _subTabWidgets[currentSubTabIndex];
    }

    // Остальные вкладки
    switch (currentPageIndex) {
      case 1:
        return const Center(
          child: Text('Билеты', style: TextStyle(color: AppColors.mainColorBlack)),
        );
      case 2:
        return const Center(
          child: Text('Моё', style: TextStyle(color: AppColors.mainColorBlack)),
        );
      case 3:
        return const Center(
          child: Text('Поиск', style: TextStyle(color: AppColors.mainColorBlack)),
        );
      case 4:
        return const Center(
          child: Text('Профиль', style: TextStyle(color: AppColors.mainColorBlack)),
        );
      default:
        return const Center(
          child: Text('Главное', style: TextStyle(color: AppColors.mainColorBlack)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorWhite,
      appBar: _buildAppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (currentPageIndex == index) return;
          setState(() {
            currentPageIndex = index;
            if (currentPageIndex != 0) {
              currentSubTabIndex = 0; // сброс субвкладки при смене вкладки
            }
          });
        },
        indicatorColor: AppColors.mainColorBlack,
        selectedIndex: currentPageIndex,
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
// ------------------------- DATA CLASS -------------------------
class NavigationDestinatioinData {
  final String labelText;
  final IconData selectedIcon;
  final IconData icon;
  final Color color;

  const NavigationDestinatioinData({
    required this.labelText,
    required this.selectedIcon,
    required this.icon,
    required this.color,
  });
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int currentSubTabIndex = 0;

  static const List<String> subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];

  static const List<Widget> subTabWidgets = [
    Center(child: Text('Моё кино', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Детям', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Спорт', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Каналы', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Подписки', style: AppTextStyle.textStyleWhite)),
    Center(child: Text('Загрузить', style: AppTextStyle.textStyleWhite)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.movie, color: AppColors.mainColorDeepOrange),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(subTabs.length, (i) {
                    final isSelected = currentSubTabIndex == i;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSubTabIndex = i; // <-- обновляем индекс
                          });
                        },
                        child: Text(
                          subTabs[i],
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
      ),
      body: subTabWidgets[currentSubTabIndex], // <-- тело меняется
    );
  }
}

// ------------------------- MAIN TAB APPBAR -------------------------
class MainTabAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainTabAppBar({super.key});

  @override
  State<MainTabAppBar> createState() => _MainTabAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainTabAppBarState extends State<MainTabAppBar> {
  int currentSubTabIndex = 0;

  static const List<String> subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.movie, color: AppColors.mainColorDeepOrange),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(subTabs.length, (i) {
                  final isSelected = currentSubTabIndex == i;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSubTabIndex = i;
                        });

                        // Находим MainTabScreen и обновляем его состояние
                        final mainTabState = context
                            .findAncestorStateOfType<_MainTabScreenState>();
                        mainTabState?.setState(() {
                          mainTabState.currentSubTabIndex = i;
                        });
                      },
                      child: Text(
                        subTabs[i],
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
  }
}

// ------------------------- OTHER SCREENS -------------------------
class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Билеты', style: TextStyle(color: AppColors.mainColorBlack)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Моё', style: TextStyle(color: AppColors.mainColorBlack)),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Поиск', style: TextStyle(color: AppColors.mainColorBlack)),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Профиль', style: TextStyle(color: AppColors.mainColorBlack)),
    );
  }
}
