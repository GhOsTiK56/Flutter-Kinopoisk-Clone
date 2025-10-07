import 'package:flutter_kinopoisk_clone/resources/app_images.dart';
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
    required this.id,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movieList = [
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: 'Gave of imitation',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 1,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: '2',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 2,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: '3',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 3,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: '4',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 4,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: 'aaaa',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 5,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: 'bbbb',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 6,
    ),
    Movie(
      imageName: AppImages.filmImageGameOfImitation,
      title: '6',
      time: 'October 5, 2021',
      description:
          ':LKJFGDL:FKJGD:LFJG:DLFGJ:DLFKGJ:DFLGKJDF:LGKJDFL:GKJDFL:GJKDFL:GJ',
      id: 7,
    ),
  ];

  var filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      filteredMovies = _movieList.where((element) {
        return element.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredMovies = _movieList;
    }
    setState(() {});
  }

  void _onMovieTap(int index) {
    final id = _movieList[index].id;
    Navigator.of(
      context,
    ).pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  void initState() {
    super.initState();
    filteredMovies = _movieList;
    _searchController.addListener(_searchMovies);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(top: 70),
            itemCount: filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = filteredMovies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  movie.description,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(onTap: () => _onMovieTap(index)),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              cursorColor: Colors.lightBlueAccent,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                //labelStyle: TextStyle(color: Colors.lightBlue),
                labelText: 'Find',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
