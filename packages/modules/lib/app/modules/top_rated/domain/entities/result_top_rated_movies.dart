import 'package:common/common.dart';

class ResultTopRatedMovies {
  final int page;
  final List<Movies> topRatedMovies;
  final int totalPages;
  final int totalResults;

  const ResultTopRatedMovies({
    this.page = 1,
    this.topRatedMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });
}
