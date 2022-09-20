import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_popular_movies.dart';
import 'external/datasources/tmdb_datasource.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'home_store.dart';
import 'infra/repositories/popular_movies_repository_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => HomeStore(i())),
    Bind.lazySingleton((i) => HomeController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetPopularMovies(i())),
    Bind.lazySingleton((i) => PopularMoviesRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
