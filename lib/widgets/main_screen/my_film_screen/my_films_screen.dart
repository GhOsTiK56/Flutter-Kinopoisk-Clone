import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';
import 'package:flutter_kinopoisk_clone/resources/app_images.dart';

class MyFilmsWidget extends StatelessWidget {
  const MyFilmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Фильмы для вас',
                  style: AppTextStyle.textStyleWhite.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Все',
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
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
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
                                image: AppImages.filmImageGameOfImitation,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 200,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                'Игра в имитацию',
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
                            onTap: () {
                            },
                            child: SizedBox(
                              width: 200,
                              height: 372,
                            ),
                          ),
                        )
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
