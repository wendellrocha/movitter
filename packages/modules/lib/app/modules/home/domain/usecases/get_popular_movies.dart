import 'package:dartz/dartz.dart';

import '../entities/result_popular_movies.dart';
import '../errors/errors.dart';
import '../repositories/popular_movies_repository.dart';

abstract class IGetPopularMovies {
  Future<Either<FailurePopularMovies, ResultPopularMovies>> call({
    int page = 1,
  });
}

class GetPopularMovies implements IGetPopularMovies {
  final IPopularMoviesRepository _repository;

  const GetPopularMovies(this._repository);

  @override
  Future<Either<FailurePopularMovies, ResultPopularMovies>> call({
    int page = 1,
  }) async {
    return _repository.get(page: page);
  }
}
