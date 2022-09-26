import 'package:common/common.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/result_upcoming_movies.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/upcoming_movies_repository.dart';
import '../datasources/upcoming_movies_datasource.dart';

class UpcomingMoviesRepositoryImpl implements IUpcomingMoviesRepository {
  final IUpcomingMoviesDatasource _datasource;

  const UpcomingMoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureUpcomingMovies, ResultUpcomingMovies>> get({
    int page = 1,
  }) async {
    try {
      final response = await _datasource.getUpcomingMovies(page: page);

      return Right(response);
    } on HttpError catch (e) {
      return Left(
        UpcomingMoviesDatasourceError(
          errorCode: e.statusCode ?? 500,
          message: e.message!,
        ),
      );
    } catch (e) {
      return Left(UpcomingMoviesDatasourceError(message: e.toString()));
    }
  }
}
