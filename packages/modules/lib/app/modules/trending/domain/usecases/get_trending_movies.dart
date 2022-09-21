import 'package:dartz/dartz.dart';

import '../entities/result_trending_movies.dart';
import '../errors/errors.dart';
import '../repositories/trending_movies_repository.dart';

abstract class IGetTrendingMovies {
  Future<Either<FailureTrendingMovies, ResultTrendingMovies>> call({
    int page = 1,
  });
}

class GetTrendingMoveis implements IGetTrendingMovies {
  final ITrendingMoviesRepository _repository;

  const GetTrendingMoveis(this._repository);

  @override
  Future<Either<FailureTrendingMovies, ResultTrendingMovies>> call({
    int page = 1,
  }) {
    return _repository.get(page: page);
  }
}
