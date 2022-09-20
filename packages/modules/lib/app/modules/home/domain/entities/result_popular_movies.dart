import '../../infra/models/popular_movies.dart';

class ResultPopularMovies {
  final int page;
  final List<PopularMovies> popularMovies;
  final int totalPages;
  final int totalResults;

  const ResultPopularMovies({
    required this.page,
    required this.popularMovies,
    required this.totalPages,
    required this.totalResults,
  });
}
