import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_upcoming_movies.dart';
import 'external/datasource/tmdb_datasource.dart';
import 'infra/repositories/upcoming_movies_repository_impl.dart';
import 'upcoming_controller.dart';
import 'upcoming_page.dart';
import 'upcoming_store.dart';

class UpcomingModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => UpcomingStore(i())),
    Bind.lazySingleton((i) => UpcomingController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetUpcomingMovies(i())),
    Bind.lazySingleton((i) => UpcomingMoviesRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UpcomingPage()),
  ];
}
