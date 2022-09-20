import 'popular_store.dart';

class PopularController {
  final PopularStore _store;

  PopularController(this._store);

  PopularStore get store => _store;

  void getPopularMovies({int page = 1}) => _store.getPopularMovies(page: page);
}
