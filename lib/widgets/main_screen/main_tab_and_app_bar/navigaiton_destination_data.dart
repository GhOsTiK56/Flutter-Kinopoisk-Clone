
import 'package:flutter/material.dart';

class NavigationDestinationData {
  final String labelText;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;

  const NavigationDestinationData({
    required this.labelText,
    required this.icon,
    required this.selectedIcon,
    required this.color,
  });
}