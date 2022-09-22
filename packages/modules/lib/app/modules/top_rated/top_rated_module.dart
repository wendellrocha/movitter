import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_top_rated_movies.dart';
import 'external/datasources/tmdb_datasource.dart';
import 'infra/repositories/top_rated_movies_repository_impl.dart';
import 'top_rated_controller.dart';
import 'top_rated_page.dart';
import 'top_rated_store.dart';

class TopRatedModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => TopRatedStore(i())),
    Bind.lazySingleton((i) => TopRatedController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetTopRatedMovies(i())),
    Bind.lazySingleton((i) => TopRatedMoviesRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TopRatedPage()),
  ];
}
