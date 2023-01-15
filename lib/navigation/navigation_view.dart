import 'package:flutter/material.dart';
import 'package:movies_flutter/home/di/home_factory.dart';
import 'package:movies_flutter/search/search_view_controler.dart';

abstract class NavigationViewModelProtocol with ChangeNotifier {
  int get index;
  void didTapSelectedIndex(int index);
}

class NavigationView extends StatelessWidget {
  final StatefulWidget _home = HomeFactory.home();
  final NavigationViewModelProtocol viewModel;
  NavigationView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movies do Pedro'),
            ),
            body: IndexedStack(
              index: viewModel.index,
              children: [
                _home,
                const SearchViewControler(),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisa'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
              ],
              currentIndex: viewModel.index,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: viewModel.didTapSelectedIndex,
            ),
          );
        });
  }
}
