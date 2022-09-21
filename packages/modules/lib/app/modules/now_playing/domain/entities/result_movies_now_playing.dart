import 'package:common/common.dart';

class ResultMoviesNowPlaying {
  final int page;
  final List<Movies> moviesNowPlaying;
  final int totalPages;
  final int totalResults;

  const ResultMoviesNowPlaying({
    this.page = 1,
    this.moviesNowPlaying = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });
}
