import '../../domain/entities/result_upcoming_movies.dart';

abstract class IUpcomingMoviesDatasource {
  Future<ResultUpcomingMovies> getUpcomingMovies({int page = 1});
}
