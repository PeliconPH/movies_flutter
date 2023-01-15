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
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(height: 200, child: Image.network(widget.viewModel.movies[index].image)),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.viewModel.topMovies.length,
                          itemBuilder: ((_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                height: 200,
                                child: Image.network(widget.viewModel.topMovies[index].image),
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
