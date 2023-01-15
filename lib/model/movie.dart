import '../api/api_host.dart';

class Movie {
  final int id;
  final String title;
  final num voteAverage;
  final String _posterPath;

  String get image => '${ApiHost.baseImageURL}$_posterPath';

  Movie.fromMap(Map map)
      : id = map['id'],
        title = map['title'],
        voteAverage = map['vote_average'],
        _posterPath = map['poster_path'];
}
