import 'package:movies_flutter/home/home_view_controler.dart';
import 'package:movies_flutter/home/use_case/get_popular_movies.dart';
import 'package:movies_flutter/home/use_case/get_top_movies.dart';
import 'package:movies_flutter/model/movie.dart';

class HomeViewModel extends HomeProtocol {
  final List<Movie> _popmovies = [];
  final List<Movie> _topmovies = [];
  bool _hasError = false;
  String _error = '';

  final GetPopularMoviesUseCaseProtocol useCaseProtocol;
  final GetTopMoviesUseCaseProtocol useTopCaseProtocol;

  HomeViewModel({required this.useCaseProtocol, required this.useTopCaseProtocol});

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
  List<Movie> get movies => _popmovies;

  @override
  List<Movie> get topMovies => _topmovies;
}
