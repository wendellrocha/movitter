import 'package:common/common.dart';

import '../../domain/entities/result_top_rated_movies.dart';
import '../../infra/datasources/top_rated_movies_datasource.dart';
import '../../infra/models/result_top_rated_movies_model.dart';

class TMDBDatasource implements ITopRatedMoviesDatasource {
  final IHttpClientAdapter _client;

  const TMDBDatasource(this._client);

  @override
  Future<ResultTopRatedMovies> getTopRatedMovies({int page = 1}) async {
    final response = await _client.get(
      '/movie/top_rated${kPagination.replaceAll('{{page}}', '$page')}',
      queryParams: kQueryParams,
    );

    return response.fold(
      (l) => throw l,
      (r) => ResultTopRatedMoviesModel.fromJson(r.data),
    );
  }
}
