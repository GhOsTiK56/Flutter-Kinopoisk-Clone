import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/auth/auth_widget.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/main_tab_and_app_bar/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColorBlack,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(backgroundColor: AppColors.mainColorBlack),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.mainColorBlack,
          iconTheme: WidgetStateProperty.all(
            IconThemeData(color: AppColors.mainColorWhite),
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Colors.deepOrange);
            }
            return TextStyle(color: Colors.white);
          }),
        ),
        scaffoldBackgroundColor: AppColors.mainColorBlack,
      ),
      routes: {
        '/auth_screen': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth_screen',
    );
  }
}
