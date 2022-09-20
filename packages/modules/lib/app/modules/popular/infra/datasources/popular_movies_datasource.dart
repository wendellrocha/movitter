import '../../domain/entities/result_popular_movies.dart';

abstract class IPopularMoviesDatasource {
  Future<ResultPopularMovies> getPopularMovies({int page = 1});
}
