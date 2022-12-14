import 'package:common/common.dart';

class ResultPopularMovies {
  final int page;
  final List<Movies> popularMovies;
  final int totalPages;
  final int totalResults;

  const ResultPopularMovies({
    this.page = 1,
    this.popularMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });
}
