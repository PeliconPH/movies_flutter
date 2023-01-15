import 'package:movies_flutter/api/movies_routes.dart';

import '../../model/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(String error);

abstract class GetPopularMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MovieRoutesProtocol routes;
  GetPopularMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getPopularMovies(
      success: (result) {
        final movies = List<Movie>.from(result['results']?.map((map) => Movie.fromMap(map)));
        success?.call(movies);
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
