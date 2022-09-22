import 'package:common/common.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/result_top_rated_movies.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/top_rated_movies_repository.dart';
import '../datasources/top_rated_movies_datasource.dart';

class TopRatedMoviesRepositoryImpl implements ITopRatedMoviesRepository {
  final ITopRatedMoviesDatasource _datasource;

  const TopRatedMoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureTopRatedMovies, ResultTopRatedMovies>> get({
    int page = 1,
  }) async {
    try {
      final result = await _datasource.getTopRatedMovies(page: page);

      return Right(result);
    } on HttpError catch (e) {
      return Left(
        FailureTopRatedMoviesDatasourceError(
          errorCode: e.statusCode ?? 500,
          message: e.message!,
        ),
      );
    } catch (e) {
      return Left(FailureTopRatedMoviesDatasourceError(message: e.toString()));
    }
  }
}
