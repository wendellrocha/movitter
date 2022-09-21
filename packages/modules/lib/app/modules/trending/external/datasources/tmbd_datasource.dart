import 'package:common/common.dart';

import '../../domain/entities/result_trending_movies.dart';
import '../../infra/datasources/trending_movies_datasource.dart';
import '../../infra/models/result_trending_movies_model.dart';

class TMDBDatasource implements ITrendingMoviesDatasource {
  final IHttpClientAdapter _client;

  const TMDBDatasource(this._client);

  @override
  Future<ResultTrendingMovies> getTrendingMovies({int page = 1}) async {
    final response = await _client.get(
      'trending/movie/week$kApiKey$kLanguage$kPagination'
          .replaceAll('{{page}}', '$page'),
    );

    return response.fold(
      (l) => throw l,
      (r) => ResultTrendingMoviesModel.fromJson(
        r.data,
      ),
    );
  }
}
