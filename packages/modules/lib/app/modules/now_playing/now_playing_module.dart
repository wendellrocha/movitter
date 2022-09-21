import 'package:dependencies/dependencies.dart';

import 'domain/usecases/get_movies_now_playing.dart';
import 'external/datasources/tmdb_datasource.dart';
import 'infra/repositories/movies_now_playing_repository_impl.dart';
import 'now_playing_controller.dart';
import 'now_playing_page.dart';
import 'now_playing_store.dart';

class NowPlayingModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => NowPlayingStore(i())),
    Bind.lazySingleton((i) => NowPlayingController(i())),
    Bind.lazySingleton((i) => TMDBDatasource(i())),
    Bind.lazySingleton((i) => GetMoviesNowPlaying(i())),
    Bind.lazySingleton((i) => MoviesNowPlayingRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NowPlayingPage()),
  ];
}
