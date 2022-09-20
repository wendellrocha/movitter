import 'package:common/common.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/result_popular_movies.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/popular_movies_repository.dart';
import '../datasources/popular_movies_datasource.dart';

class PopularMoviesRepositoryImpl implements IPopularMoviesRepository {
  final IPopularMoviesDatasource _datasource;

  const PopularMoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<FailurePopularMovies, ResultPopularMovies>> get({
    int page = 1,
  }) async {
    try {
      final result = await _datasource.getPopularMovies(page: page);

      return Right(result);
    } on HttpError catch (e) {
      return Left(
        PopularMoviesDatasourceError(
          errorCode: e.statusCode ?? 500,
          message: e.message!,
        ),
      );
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Left(PopularMoviesDatasourceError(message: e.toString()));
    }
  }
}
