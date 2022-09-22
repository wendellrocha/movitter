import '../../domain/entities/result_top_rated_movies.dart';

abstract class ITopRatedMoviesDatasource {
  Future<ResultTopRatedMovies> getTopRatedMovies({int page = 1});
}
