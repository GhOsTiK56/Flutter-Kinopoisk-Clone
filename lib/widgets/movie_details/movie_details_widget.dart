import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/movie_details/movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorDarkBlue,
        title: Text(
          'Game of Imitation',
          style: TextStyle(color: AppColors.mainColorWhite),
        ),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(22, 23, 27, 1),
        child: ListView(children: [MovieDetailsMainInfoWidget()]),
      ),
    );
  }
}
