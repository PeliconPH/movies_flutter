import 'package:movies_flutter/model/movie.dart';
import 'package:movies_flutter/suporte/componentes/movie_item/movie_item.dart';

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movie movie;
  MovieItemViewModel({required this.movie});

  @override
  String get movieIMDB => 'IMDB ${movie.voteAverage}';

  @override
  String get movieImagen => movie.image;

  @override
  String get movieTitle => movie.title;
}
