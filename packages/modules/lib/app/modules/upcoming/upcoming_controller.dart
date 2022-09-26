import 'upcoming_store.dart';

class UpcomingController {
  final UpcomingStore _store;

  const UpcomingController(this._store);

  UpcomingStore get store => _store;

  void getUpcomingMovies({int page = 1}) =>
      _store.getUpcomingMovies(page: page);
}
