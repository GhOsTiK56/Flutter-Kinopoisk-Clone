import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/resources/app_images.dart';
import 'package:flutter_kinopoisk_clone/widgets/elements/radial_percent_widget.dart';

// child: SizedBox(
//   width: 100,
//   height: 100,
//   child: RadialPercentWidget(
//     percent: 0.72,
//     fillColor: Colors.black,
//     lineColor: Colors.green,
//     freeColor: Colors.grey,
//     lineWidth: 5,

//     child: Text(
//       '72%',
//       style: TextStyle(
//         color: AppColors.mainColorWhite,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// ),
class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(padding: const EdgeInsets.all(20.0), child: _MovieNameWidget()),
        _ScoreMovieWidget(),
        _SummaryWidget(),
        Padding(padding: const EdgeInsets.all(15.0), child: _overviewWidget()),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: _descriptionWidget(),
        ),
        SizedBox(height: 30),
        _PeopleWidget(),
      ],
    );
  }

  Text _descriptionWidget() {
    return Text(
      'Overview oipdfjsgpoifdjg pofdghijfvbdkn pofihjd fokgbnpofdgijh rtweogj pobijdfo ij rewpoeijt ofknbd posierjg oksfdnmb ;oisjapoi jerfgoksng o;isdfjbv posdfijg ;oeriwsjg ;oij ',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.mainColorWhite,
      ),
    );
  }

  Text _overviewWidget() {
    return Text(
      'Overview',
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: AppColors.mainColorWhite,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.topHeader)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.filmImageGameOfImitation)),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
            text: ';ldkjfg;lkjdflg;kjlkjsdflkjs;ldkjf',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.mainColorWhite,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreMovieWidget extends StatelessWidget {
  const _ScoreMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double percent = 0.73;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: RadialPercentWidget(
                  percent: percent,
                  fillColor: Colors.black,
                  lineColor: Colors.green,
                  freeColor: Colors.grey,
                  lineWidth: 5,
                  child: Text(
                    '${(percent * 100).round()}%',
                    style: TextStyle(
                      color: AppColors.mainColorWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('User Score'),
            ],
          ),
        ),
        Container(width: 1, height: 20, color: Colors.grey),
        TextButton(
          onPressed: () {},
          child: Row(children: [Icon(Icons.play_arrow), Text('Play Trailer')]),
        ),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          ';lkjdfg ;ldkflj gfdjkert kjdfgl ert jjsdf',
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );

    final jobTitleStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdgsdgf', style: nameStyle),
                Text('sdfgdfgdfgdfgdf', style: jobTitleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdgsdgf', style: nameStyle),
                Text('sdfgdfgdfgdfgdf', style: jobTitleStyle),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdgsdgf', style: nameStyle),
                Text('sdfgdfgdfgdfgdf', style: jobTitleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdgsdgf', style: nameStyle),
                Text('sdfgdfgdfgdfgdf', style: jobTitleStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
