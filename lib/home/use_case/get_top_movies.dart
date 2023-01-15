import 'package:movies_flutter/api/movies_routes.dart';

import '../../model/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(String error);

abstract class GetTopMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetTopMoviesUseCase extends GetTopMoviesUseCaseProtocol {
  final MovieRoutesProtocol routes;
  GetTopMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getTopMovies(
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
