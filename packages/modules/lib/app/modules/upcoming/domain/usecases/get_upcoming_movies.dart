import 'package:dartz/dartz.dart';

import '../entities/result_upcoming_movies.dart';
import '../errors/errors.dart';
import '../repositories/upcoming_movies_repository.dart';

abstract class IGetUpcomingMovies {
  Future<Either<FailureUpcomingMovies, ResultUpcomingMovies>> call({
    int page = 1,
  });
}

class GetUpcomingMovies implements IGetUpcomingMovies {
  final IUpcomingMoviesRepository _repository;

  const GetUpcomingMovies(this._repository);

  @override
  Future<Either<FailureUpcomingMovies, ResultUpcomingMovies>> call({
    int page = 1,
  }) {
    return _repository.get(page: page);
  }
}
