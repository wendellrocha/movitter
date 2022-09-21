import 'package:dartz/dartz.dart';

import '../entities/result_movies_now_playing.dart';
import '../errors/errors.dart';

abstract class IMoviesNowPlayingRepository {
  Future<Either<FailureMoviesNowPlaying, ResultMoviesNowPlaying>> get({
    int page = 1,
  });
}
