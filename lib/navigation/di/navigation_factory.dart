import 'package:flutter/cupertino.dart';
import 'package:movies_flutter/navigation/navigation_view_controler.dart';
import 'package:movies_flutter/navigation/navigation_view_model.dart';

class NavigationFactory {
  static const String route = '/navigation';
  static StatefulWidget navigation() {
    final viewModel = NavigationViewModel();

    return NavigationViewControler(viewModel: viewModel);
  }
}
