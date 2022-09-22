import 'package:dartz/dartz.dart';

import '../entities/result_top_rated_movies.dart';
import '../errors/errors.dart';
import '../repositories/top_rated_movies_repository.dart';

abstract class IGetTopRatedMovies {
  Future<Either<FailureTopRatedMovies, ResultTopRatedMovies>> call({
    int page = 1,
  });
}

class GetTopRatedMovies implements IGetTopRatedMovies {
  final ITopRatedMoviesRepository _repository;

  const GetTopRatedMovies(this._repository);

  @override
  Future<Either<FailureTopRatedMovies, ResultTopRatedMovies>> call({
    int page = 1,
  }) async {
    return _repository.get(page: page);
  }
}
