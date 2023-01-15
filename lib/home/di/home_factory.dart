import 'package:flutter/cupertino.dart';
import 'package:movies_flutter/api/movies_routes.dart';
import 'package:movies_flutter/home/use_case/get_popular_movies.dart';
import 'package:movies_flutter/home/use_case/get_top_movies.dart';

import '../home_view_controler.dart';
import '../home_view_model.dart';

class HomeFactory {
  static const String route = '/Home';
  static StatefulWidget home() {
    final routes = MovieRoutes();
    final useCase = GetPopularMoviesUseCase(routes: routes);
    final useTopCase = GetTopMoviesUseCase(routes: routes);
    final viewModel = HomeViewModel(useCaseProtocol: useCase, useTopCaseProtocol: useTopCase);

    return HomeViewControler(viewModel: viewModel);
  }
}
