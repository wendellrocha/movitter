import 'package:common/common.dart';

class ResultUpcomingMovies {
  final int page;
  final List<Movies> upcomingMovies;
  final int totalPages;
  final int totalResults;

  const ResultUpcomingMovies({
    this.page = 1,
    this.upcomingMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });
}
