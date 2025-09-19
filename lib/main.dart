import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/widgets/auth/auth_widget.dart';
import 'package:flutter_kinopoisk_clone/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(24, 28, 29, 1),)
      ),
      routes: {
        '/auth_screen': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth_screen',
    );
  }
}