import 'package:flutter/material.dart';
import 'package:movies_flutter/navigation/navigation_view.dart';

abstract class NavigationProtocol extends NavigationViewModelProtocol {}

class NavigationViewControler extends StatefulWidget {
  final NavigationProtocol viewModel;
  const NavigationViewControler({Key? key, required this.viewModel}) : super(key: key);

  @override
  _NavigationViewControlerState createState() => _NavigationViewControlerState();
}

class _NavigationViewControlerState extends State<NavigationViewControler> {
  final int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      int selectedIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(viewModel: widget.viewModel);
  }
}
