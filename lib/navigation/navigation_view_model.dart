import 'package:movies_flutter/navigation/navigation_view_controler.dart';

class NavigationViewModel extends NavigationProtocol {
  int _index = 0;
  @override
  void didTapSelectedIndex(int index) {
    _index = index;
    notifyListeners();
  }

  @override
  int get index => _index;
}
