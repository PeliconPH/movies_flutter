import 'package:flutter/material.dart';

import '../model/movie.dart';

abstract class HomeProtocol extends ChangeNotifier {
  void getPopularMovies();
  void getTopMovies();
  List<Movie> get movies;
  List<Movie> get topMovies;
}

class HomeViewControler extends StatefulWidget {
  final HomeProtocol viewModel;
  const HomeViewControler({super.key, required this.viewModel});

  @override
  State<HomeViewControler> createState() => _HomeViewControlerState();
}

class _HomeViewControlerState extends State<HomeViewControler> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getPopularMovies();
    widget.viewModel.getTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: widget.viewModel,
          builder: (context, _) {
            return LayoutBuilder(builder: (context, size) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: size.maxHeight,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.viewModel.movies.length,
                          itemBuilder: ((_, index) {
                            final rate = widget.viewModel.movies[index].voteAverage;
                            final titleMovies = widget.viewModel.movies[index].title;
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(widget.viewModel.movies[index].image),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            alignment: AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                color: Colors.green,
                                                width: 100,
                                                height: 40,
                                              ),
                                              Text(
                                                'IMDB $rate',
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            alignment: AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                width: 185,
                                                height: 60,
                                              ),
                                              SizedBox(
                                                width: 185,
                                                child: Text(
                                                  titleMovies,
                                                  textAlign: TextAlign.justify,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.viewModel.topMovies.length,
                          itemBuilder: ((_, index) {
                            final rateTop = widget.viewModel.topMovies[index].voteAverage;
                            final titleTopMovies = widget.viewModel.topMovies[index].title;
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(widget.viewModel.topMovies[index].image),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            alignment: AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                color: Colors.green,
                                                width: 100,
                                                height: 40,
                                              ),
                                              Text(
                                                'IMDB $rateTop',
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            alignment: AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                width: 185,
                                                height: 60,
                                              ),
                                              SizedBox(
                                                width: 185,
                                                child: Text(
                                                  titleTopMovies,
                                                  textAlign: TextAlign.justify,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
    );
  }
}
