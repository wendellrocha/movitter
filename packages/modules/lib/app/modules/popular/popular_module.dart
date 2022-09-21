import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_popular_movies.dart';
import 'external/datasources/tmdb_datasource.dart';
import 'infra/repositories/popular_movies_repository_impl.dart';
import 'popular_controller.dart';
import 'popular_page.dart';
import 'popular_store.dart';

class PopularModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => PopularStore(i())),
    Bind.lazySingleton((i) => PopularController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetPopularMovies(i())),
    Bind.lazySingleton((i) => PopularMoviesRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PopularPage()),
  ];
}
