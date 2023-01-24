import 'package:movies_flutter/home/home_view_controler.dart';
import 'package:movies_flutter/home/use_case/get_popular_movies.dart';
import 'package:movies_flutter/home/use_case/get_top_movies.dart';
import 'package:movies_flutter/home/use_case/get_up_movies.dart';
import 'package:movies_flutter/model/movie.dart';
import 'package:movies_flutter/suporte/componentes/movie_item/movie_item.dart';
import 'package:movies_flutter/suporte/componentes/movie_item/movie_item_view_model.dart';

class HomeViewModel extends HomeProtocol {
  final List<Movie> _popmovies = [];
  final List<Movie> _topmovies = [];
  final List<Movie> _upmovies = [];
  bool _hasError = false;
  String _error = '';

  final GetPopularMoviesUseCaseProtocol useCaseProtocol;
  final GetTopMoviesUseCaseProtocol useTopCaseProtocol;
  final GetUpMoviesUseCaseProtocol useUpCaseProtocol;

  HomeViewModel({
    required this.useCaseProtocol,
    required this.useTopCaseProtocol,
    required this.useUpCaseProtocol,
  });

  @override
  void getPopularMovies() {
    useCaseProtocol.execute(
      success: (movies) {
        _popmovies.addAll(movies);
        notifyListeners();
      },
      failure: (error) {
        _hasError = true;
        _error = error;
      },
    );
  }

  @override
  void getTopMovies() {
    useTopCaseProtocol.execute(
      success: (movies) {
        _topmovies.addAll(movies);
        notifyListeners();
      },
      failure: (error) {
        _hasError = true;
        _error = error;
      },
    );
  }

  @override
  void getUpMovies() {
    useUpCaseProtocol.execute(
      success: (movies) {
        _upmovies.addAll(movies);
        notifyListeners();
      },
      failure: (error) {
        _hasError = true;
        _error = error;
      },
    );
  }

  @override
  List<MovieItemViewModelProtocol> get movies {
    return List<MovieItemViewModelProtocol>.from(_popmovies.map((itemMovie) => MovieItemViewModel(movie: itemMovie)));
  }

  @override
  List<MovieItemViewModelProtocol> get topMovies {
    return List<MovieItemViewModelProtocol>.from(_topmovies.map((itemMovie) => MovieItemViewModel(movie: itemMovie)));
  }

  @override
  // TODO: implement upComing
  List<MovieItemViewModelProtocol> get upMovies {
    return List<MovieItemViewModelProtocol>.from(_upmovies.map((itemMovie) => MovieItemViewModel(movie: itemMovie)));
  }
}
