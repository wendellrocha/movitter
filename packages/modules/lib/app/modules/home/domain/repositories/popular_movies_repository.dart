import 'package:dartz/dartz.dart';

import '../entities/result_popular_movies.dart';
import '../errors/errors.dart';

abstract class IPopularMoviesRepository {
  Future<Either<FailurePopularMovies, ResultPopularMovies>> get({int page = 1});
}
