import 'package:movies_flutter/api/api_provider.dart';
import 'package:movies_flutter/api/endpoint.dart';

abstract class MovieRoutesProtocol {
  void getPopularMovies({Success? success, Failure? failure});
  void getTopMovies({Success? success, Failure? failure});
  void getUpMovies({Success? success, Failure? failure});
}

class MovieRoutes extends MovieRoutesProtocol {
  final ApiProvider _provider = ApiProvider();
  @override
  void getPopularMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/popular', method: 'Get');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getTopMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/top_rated', method: 'Get');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getUpMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/upcoming', method: 'Get');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
