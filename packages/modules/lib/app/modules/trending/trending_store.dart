import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/result_trending_movies.dart';
import 'domain/errors/errors.dart';
import 'domain/usecases/get_trending_movies.dart';
import 'infra/models/result_trending_movies_model.dart';

class TrendingStore
    extends NotifierStore<FailureTrendingMovies, ResultTrendingMovies> {
  final IGetTrendingMovies _usecase;

  TrendingStore(this._usecase) : super(const ResultTrendingMoviesModel());

  void getTrendingMovies({int page = 1}) async {
    setLoading(true);
    final response = await _usecase.call(page: page);
    response.fold(setError, update);
    setLoading(false);
  }
}
