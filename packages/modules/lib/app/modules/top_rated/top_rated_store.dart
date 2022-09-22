import 'package:dependencies/dependencies.dart';

import 'domain/entities/result_top_rated_movies.dart';
import 'domain/errors/errors.dart';
import 'domain/usecases/get_top_rated_movies.dart';
import 'infra/models/result_top_rated_movies_model.dart';

class TopRatedStore
    extends NotifierStore<FailureTopRatedMovies, ResultTopRatedMovies> {
  final IGetTopRatedMovies _usecase;

  TopRatedStore(this._usecase) : super(const ResultTopRatedMoviesModel());

  void getTopRatedMovies({int page = 1}) async {
    setLoading(true);
    final response = await _usecase.call(page: page);
    response.fold(setError, update);
    setLoading(false);
  }
}
