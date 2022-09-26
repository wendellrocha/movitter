import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/result_upcoming_movies.dart';
import 'domain/errors/errors.dart';
import 'domain/usecases/get_upcoming_movies.dart';
import 'infra/models/result_upcoming_movies_model.dart';

class UpcomingStore
    extends NotifierStore<FailureUpcomingMovies, ResultUpcomingMovies> {
  final IGetUpcomingMovies _usecase;

  UpcomingStore(this._usecase) : super(const ResultUpcomingMoviesModel());

  void getUpcomingMovies({int page = 1}) async {
    setLoading(true);
    final result = await _usecase.call(page: page);
    result.fold(setError, update);
    setLoading(false);
  }
}
