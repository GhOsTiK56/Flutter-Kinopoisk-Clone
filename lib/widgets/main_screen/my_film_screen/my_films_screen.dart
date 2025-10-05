import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';
import 'package:flutter_kinopoisk_clone/resources/app_images.dart';

class Movie {
  final String imageName;
  final String titleName;

  Movie({required this.imageName, required this.titleName});
}

class MovieSections {
  final String sectionName;
  final String buttonName;
  final List<Movie> movies;

  MovieSections({
    required this.sectionName,
    required this.buttonName,
    required this.movies,
  });
}

class MyFilmsWidget extends StatelessWidget {
  final _section = [
    MovieSections(
      sectionName: 'Фильмы для вас',
      buttonName: 'Все',
      movies: [
        Movie(
          imageName: AppImages.filmImageGameOfImitation,
          titleName: 'Игра в имитацию',
        ),
        Movie(
          imageName: AppImages.filmImageGameOfImitation,
          titleName: 'Бег за форестом',
        ),
      ],
    ),
        MovieSections(
      sectionName: 'Новинки в кино',
      buttonName: 'Все',
      movies: [
        Movie(
          imageName: AppImages.filmImageGameOfImitation,
          titleName: 'Мортал комбат',
        ),
        Movie(
          imageName: AppImages.filmImageGameOfImitation,
          titleName: 'Первый на земле',
        ),
      ],
    ),
  ];

  MyFilmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: _section.length,
      itemBuilder: (BuildContext context, int index) {
        final section = _section[index];
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  section.sectionName,
                  style: AppTextStyle.textStyleWhite.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    section.buttonName,
                    style: TextStyle(
                      color: AppColors.mainColorDeepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 372,
              child: ListView.builder(
                itemCount: section.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = section.movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 300,
                              child: Image(
                                image: AssetImage(movie.imageName),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 200,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                movie.titleName,
                                style: AppTextStyle.textStyleWhite.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(width: 200, height: 372),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        );
      },
    );
  }
}
