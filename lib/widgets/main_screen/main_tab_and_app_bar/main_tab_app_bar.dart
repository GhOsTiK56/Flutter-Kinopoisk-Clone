import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';

class MainTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentSubTabIndex;
  final ValueChanged<int> onSubTabChanged;

  const MainTabAppBar({
    super.key,
    required this.currentSubTabIndex,
    required this.onSubTabChanged,
  });

  static const List<String> subTabs = [
    'Моё кино',
    'Детям',
    'Спорт',
    'Каналы',
    'Подписки',
    'Загрузить',
  ];

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
                      onTap: () => onSubTabChanged(i),
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