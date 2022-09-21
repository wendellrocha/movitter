import 'trending_store.dart';

class TrendingController {
  final TrendingStore _store;

  TrendingController(this._store);

  TrendingStore get store => _store;

  void getTredingMovies({int page = 1}) => _store.getTrendingMovies(page: page);
}
