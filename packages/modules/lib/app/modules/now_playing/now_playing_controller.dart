import 'now_playing_store.dart';

class NowPlayingController {
  final NowPlayingStore _store;

  const NowPlayingController(this._store);

  NowPlayingStore get store => _store;

  void getMoviesNowPlaying({int page = 1}) =>
      _store.getMoviesNowPlaying(page: page);
}
