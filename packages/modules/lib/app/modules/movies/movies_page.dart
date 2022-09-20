import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  final String title;
  const MoviesPage({Key? key, this.title = 'MoviesPage'}) : super(key: key);
  @override
  MoviesPageState createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> {
  final RxNotifier<int> _currentIndex = RxNotifier<int>(0);

  final MenuItems _menuItems = List.unmodifiable([
    const MenuItemModel(
      icon: Icons.trending_up,
      route: '/movies/trending/',
    ),
    const MenuItemModel(
      icon: Icons.star_rate,
      route: '/movies/popular/',
    ),
    const MenuItemModel(
      icon: Icons.theaters_sharp,
      route: '/movies/now-playing/',
    ),
    const MenuItemModel(
      icon: Icons.thumbs_up_down,
      route: '/movies/top-rated/',
    ),
    const MenuItemModel(
      icon: Icons.upcoming,
      route: '/movies/upcoming/',
    ),
  ]);

  @override
  void initState() {
    super.initState();

    Modular.to.addListener(() {
      int index = _menuItems
          .map((e) => e.route)
          .toList()
          .indexWhere((element) => element == Modular.to.path);

      if (!index.isNegative) {
        _onTap(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: RxBuilder(
        builder: (_) => BottomNavigationBarWidget(
          items: _menuItems,
          currentIndex: _currentIndex.value,
          onTap: _onTap,
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (index > _menuItems.length) return;
    _currentIndex.value = index;
    Modular.to.navigate(_menuItems[index].route);
  }
}
