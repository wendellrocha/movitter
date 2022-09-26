import 'package:common/common.dart';

import '../../domain/entities/result_upcoming_movies.dart';
import '../../infra/datasources/upcoming_movies_datasource.dart';
import '../../infra/models/result_upcoming_movies_model.dart';

class TMDBDatasource implements IUpcomingMoviesDatasource {
  final IHttpClientAdapter _client;

  const TMDBDatasource(this._client);

  @override
  Future<ResultUpcomingMovies> getUpcomingMovies({int page = 1}) async {
    final response = await _client.get(
      '/movie/upcoming${kPagination.replaceAll('{{page}}', '$page')}',
      queryParams: kQueryParams,
    );

    return response.fold(
      (l) => throw l,
      (r) => ResultUpcomingMoviesModel.fromJson(r.data),
    );
  }
}
