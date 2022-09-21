import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_trending_movies.dart';
import 'external/datasources/tmbd_datasource.dart';
import 'infra/repositories/trending_movies_repository_impl.dart';
import 'trending_controller.dart';
import 'trending_page.dart';
import 'trending_store.dart';

class TrendingModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => TrendingStore(i())),
    Bind.lazySingleton((i) => TrendingController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetTrendingMoveis(i())),
    Bind.lazySingleton((i) => TrendingMoviesRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TrendingPage()),
  ];
}
