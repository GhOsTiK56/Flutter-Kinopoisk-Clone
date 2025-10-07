import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/auth/auth_widget.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_kinopoisk_clone/widgets/movie_details/movie_details_widget.dart';

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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainColorDarkBlue,
          selectedItemColor: AppColors.mainColorWhite,
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: AppBarThemeData(
          iconTheme: IconThemeData(color: AppColors.mainColorWhite),
        ),
      ),
      routes: {
        '/auth_screen': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        },
      },
      initialRoute: '/auth_screen',
    );
  }
}
