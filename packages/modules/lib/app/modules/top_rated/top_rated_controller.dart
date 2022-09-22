import 'top_rated_store.dart';

class TopRatedController {
  final TopRatedStore _store;

  const TopRatedController(this._store);

  TopRatedStore get store => _store;

  void getTopRatedMovies({int page = 1}) =>
      _store.getTopRatedMovies(page: page);
}
