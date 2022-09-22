import 'package:common/common.dart';

import '../../domain/entities/result_popular_movies.dart';
import '../../infra/datasources/popular_movies_datasource.dart';
import '../../infra/models/result_popular_movies_model.dart';

class TMDBDatasource implements IPopularMoviesDatasource {
  final IHttpClientAdapter _client;

  const TMDBDatasource(this._client);

  @override
  Future<ResultPopularMovies> getPopularMovies({int page = 1}) async {
    final response = await _client.get(
      'movie/popular$kPagination'.replaceAll('{{page}}', '$page'),
      queryParams: kQueryParams,
    );

    return response.fold(
      (l) => throw l,
      (r) => ResultPopularMoviesModel.fromJson(r.data),
    );
  }
}
