import 'package:common/common.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/result_trending_movies.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/trending_movies_repository.dart';
import '../datasources/trending_movies_datasource.dart';

class TrendingMoviesRepositoryImpl implements ITrendingMoviesRepository {
  final ITrendingMoviesDatasource _datasource;

  const TrendingMoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureTrendingMovies, ResultTrendingMovies>> get({
    int page = 1,
  }) async {
    try {
      final result = await _datasource.getTrendingMovies(page: page);

      return Right(result);
    } on HttpError catch (e) {
      return Left(
        TrendingMoviesDatasourceError(
          errorCode: e.statusCode ?? 500,
          message: e.message!,
        ),
      );
    } catch (e) {
      return Left(TrendingMoviesDatasourceError(message: e.toString()));
    }
  }
}
