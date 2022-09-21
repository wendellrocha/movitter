import 'package:dartz/dartz.dart';

import '../entities/result_movies_now_playing.dart';
import '../errors/errors.dart';
import '../repositories/movies_now_playing_repository.dart';

abstract class IGetMoviesNowPlaying {
  Future<Either<FailureMoviesNowPlaying, ResultMoviesNowPlaying>> call({
    int page = 1,
  });
}

class GetMoviesNowPlaying implements IGetMoviesNowPlaying {
  final IMoviesNowPlayingRepository _repository;

  const GetMoviesNowPlaying(this._repository);

  @override
  Future<Either<FailureMoviesNowPlaying, ResultMoviesNowPlaying>> call({
    int page = 1,
  }) async {
    return _repository.get(page: page);
  }
}
