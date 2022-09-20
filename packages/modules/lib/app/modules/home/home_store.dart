import 'package:dependencies/dependencies.dart';

import 'domain/entities/result_popular_movies.dart';
import 'domain/errors/errors.dart';
import 'domain/repositories/popular_movies_repository.dart';
import 'infra/models/popular_movies_model.dart';

class HomeStore
    extends NotifierStore<FailurePopularMovies, ResultPopularMovies> {
  final IPopularMoviesRepository _repository;

  HomeStore(this._repository)
      : super(
          const ResultPopularMoviesModel(
            page: 1,
            popularMovies: [],
            totalPages: 1,
            totalResults: 1,
          ),
        );

  void getPopularMovies({int page = 1}) async {
    setLoading(true);
    final response = await _repository.get(page: page);
    response.fold(setError, update);
    setLoading(false);
  }
}
