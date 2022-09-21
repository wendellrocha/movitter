import 'package:common/common.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/result_movies_now_playing.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/movies_now_playing_repository.dart';
import '../datasources/movies_now_playing_datasource.dart';

class MoviesNowPlayingRepositoryImpl implements IMoviesNowPlayingRepository {
  final IMoviesNowPlayingDatasource _datasource;

  const MoviesNowPlayingRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureMoviesNowPlaying, ResultMoviesNowPlaying>> get({
    int page = 1,
  }) async {
    try {
      final result = await _datasource.getMoviesNowPlaying(page: page);

      return Right(result);
    } on HttpError catch (e) {
      return Left(
        MoviesNowPlayingDatasourceError(
          errorCode: e.statusCode ?? 500,
          message: e.message!,
        ),
      );
    } catch (e) {
      return Left(MoviesNowPlayingDatasourceError(message: e.toString()));
    }
  }
}
