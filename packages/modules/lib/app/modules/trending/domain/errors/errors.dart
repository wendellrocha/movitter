import 'package:common/common.dart';

abstract class FailureTrendingMovies implements Failure {}

class TrendingMoviesDatasourceError implements FailureTrendingMovies {
  @override
  final String message;
  final int errorCode;

  const TrendingMoviesDatasourceError({
    required this.message,
    this.errorCode = 500,
  });
}
