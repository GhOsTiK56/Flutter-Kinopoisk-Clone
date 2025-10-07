import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/widgets/elements/radial_percent_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: RadialPercentWidget(
          percent: 0.72,
          fillColor: Colors.black,
          lineColor: Colors.green,
          freeColor: Colors.grey,
          lineWidth: 5,

          child: Text(
            '72%',
            style: TextStyle(
              color: AppColors.mainColorWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
