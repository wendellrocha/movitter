import 'package:common/common.dart';

import '../../domain/entities/result_movies_now_playing.dart';
import '../../infra/datasources/movies_now_playing_datasource.dart';
import '../../infra/models/result_movies_now_playing_model.dart';

class TMDBDatasource implements IMoviesNowPlayingDatasource {
  final IHttpClientAdapter _client;

  const TMDBDatasource(this._client);

  @override
  Future<ResultMoviesNowPlaying> getMoviesNowPlaying({int page = 1}) async {
    final response = await _client.get(
      'movie/now_playing$kApiKey$kLanguage$kPagination'
          .replaceAll('{{page}}', '$page'),
    );

    return response.fold(
      (l) => throw l,
      (r) => ResultMoviesNowPlayingModel.fromJson(r.data),
    );
  }
}
