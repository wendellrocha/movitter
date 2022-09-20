import 'package:flutter_modular/flutter_modular.dart';

import '../now_playing/now_playing_module.dart';
import '../popular/popular_module.dart';
import '../top_rated/top_rated_module.dart';
import '../trending/trending_module.dart';
import '../upcoming/upcoming_module.dart';
import 'movies_page.dart';

class MoviesModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const MoviesPage(),
      children: [
        ModuleRoute('/popular', module: PopularModule()),
        ModuleRoute('/now-playing', module: NowPlayingModule()),
        ModuleRoute('/top-rated', module: TopRatedModule()),
        ModuleRoute('/upcoming', module: UpcomingModule()),
        ModuleRoute('/trending', module: TrendingModule()),
      ],
    ),
  ];
}
