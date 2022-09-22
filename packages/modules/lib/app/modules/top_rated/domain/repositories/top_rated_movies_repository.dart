import 'package:dartz/dartz.dart';

import '../entities/result_top_rated_movies.dart';
import '../errors/errors.dart';

abstract class ITopRatedMoviesRepository {
  Future<Either<FailureTopRatedMovies, ResultTopRatedMovies>> get({
    int page = 1,
  });
}
