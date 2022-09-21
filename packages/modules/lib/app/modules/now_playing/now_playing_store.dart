import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/result_movies_now_playing.dart';
import 'domain/errors/errors.dart';
import 'domain/usecases/get_movies_now_playing.dart';
import 'infra/models/result_movies_now_playing_model.dart';

class NowPlayingStore
    extends NotifierStore<FailureMoviesNowPlaying, ResultMoviesNowPlaying> {
  final IGetMoviesNowPlaying _usecase;

  NowPlayingStore(this._usecase) : super(const ResultMoviesNowPlayingModel());

  void getMoviesNowPlaying({int page = 1}) async {
    setLoading(true);
    final result = await _usecase.call(page: page);
    result.fold(setError, update);
    setLoading(false);
  }
}
