import '../../domain/entities/result_movies_now_playing.dart';

abstract class IMoviesNowPlayingDatasource {
  Future<ResultMoviesNowPlaying> getMoviesNowPlaying({int page = 1});
}
