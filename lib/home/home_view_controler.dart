import 'package:flutter/material.dart';
import 'package:movies_flutter/suporte/componentes/movie_item/movie_item.dart';

abstract class HomeProtocol extends ChangeNotifier {
  void getPopularMovies();
  void getTopMovies();
  void getUpMovies();
  List<MovieItemViewModelProtocol> get movies;
  List<MovieItemViewModelProtocol> get topMovies;
  List<MovieItemViewModelProtocol> get upMovies;
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
    widget.viewModel.getUpMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
          animation: widget.viewModel,
          builder: (context, _) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Filmes Populares
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Text(
                        'Filmes Populares',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 280),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.viewModel.movies.length,
                        itemBuilder: ((_, index) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: MovieItemView(
                              viewModel: widget.viewModel.movies[index],
                            ),
                          );
                        }),
                      ),
                    ),
                    //Filmes Aclamados pelas Criticas
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Text(
                        'Filmes Aclamados pelas Criticas',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 280),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.viewModel.topMovies.length,
                        itemBuilder: ((_, index) {
                          return ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: MovieItemView(viewModel: widget.viewModel.topMovies[index]));
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
