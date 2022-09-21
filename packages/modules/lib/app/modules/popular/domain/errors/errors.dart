import 'package:common/common.dart';

abstract class FailurePopularMovies implements Failure {}

class PopularMoviesDatasourceError implements FailurePopularMovies {
  @override
  final String message;
  final int errorCode;

  const PopularMoviesDatasourceError({
    required this.message,
    this.errorCode = 500,
  });
}
