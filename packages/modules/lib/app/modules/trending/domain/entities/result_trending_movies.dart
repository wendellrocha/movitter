import 'package:common/common.dart';

class ResultTrendingMovies {
  final int page;
  final List<Movies> trendingMovies;
  final int totalPages;
  final int totalResults;

  const ResultTrendingMovies({
    this.page = 1,
    this.trendingMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });
}
