import 'package:dartz/dartz.dart';

import '../entities/result_trending_movies.dart';
import '../errors/errors.dart';

abstract class ITrendingMoviesRepository {
  Future<Either<FailureTrendingMovies, ResultTrendingMovies>> get({
    int page = 1,
  });
}
