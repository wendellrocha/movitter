import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'movies_controller.dart';

class MoviesPage extends StatefulWidget {
  final String title;
  const MoviesPage({Key? key, this.title = 'MoviesPage'}) : super(key: key);
  @override
  MoviesPageState createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> {
  final controller = Modular.get<MoviesController>();

  @override
  void initState() {
    super.initState();

    Modular.to.addListener(_listener);
  }

  @override
  void dispose() {
    Modular.to.removeListener(_listener);
    super.dispose();
  }

  final MenuItems _menuItems = List.unmodifiable([
    const MenuItemModel(
      icon: Icons.trending_up,
      title: 'Trending',
      route: '/movies/trending/',
    ),
    const MenuItemModel(
      icon: Icons.star_rate,
      title: 'Popular',
      route: '/movies/popular/',
    ),
    const MenuItemModel(
      icon: Icons.theaters_sharp,
      title: 'Now Playing',
      route: '/movies/now-playing/',
    ),
    const MenuItemModel(
      icon: Icons.thumbs_up_down,
      title: 'Top Rated',
      route: '/movies/top-rated/',
    ),
    const MenuItemModel(
      icon: Icons.upcoming,
      title: 'Upcoming',
      route: '/movies/upcoming/',
    ),
  ]);

  void _listener() {
    int index = _menuItems
        .map((e) => e.route)
        .toList()
        .indexWhere((element) => element == Modular.to.path);

    if (!index.isNegative) {
      _onTap(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: RxBuilder(
        builder: (_) => BottomNavigationBarWidget(
          items: _menuItems,
          currentIndex: controller.currentIndex,
          onTap: _onTap,
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (index > _menuItems.length) return;
    controller.setIndex(index);
    Modular.to.navigate(_menuItems[index].route);
  }
}
