import 'package:dartz/dartz.dart';

import '../entities/result_upcoming_movies.dart';
import '../errors/errors.dart';

abstract class IUpcomingMoviesRepository {
  Future<Either<FailureUpcomingMovies, ResultUpcomingMovies>> get({
    int page = 1,
  });
}
