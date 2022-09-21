import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/result_popular_movies.dart';
import 'domain/errors/errors.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'infra/models/result_popular_movies_model.dart';

class PopularStore
    extends NotifierStore<FailurePopularMovies, ResultPopularMovies> {
  final IGetPopularMovies _usecase;

  PopularStore(this._usecase) : super(const ResultPopularMoviesModel());

  void getPopularMovies({int page = 1}) async {
    setLoading(true);
    final response = await _usecase.call(page: page);
    response.fold(setError, update);
    setLoading(false);
  }
}
