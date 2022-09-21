import '../../domain/entities/result_trending_movies.dart';

abstract class ITrendingMoviesDatasource {
  Future<ResultTrendingMovies> getTrendingMovies({int page = 1});
}
