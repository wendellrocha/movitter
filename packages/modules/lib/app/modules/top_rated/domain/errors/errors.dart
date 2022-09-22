import 'package:common/common.dart';

abstract class FailureTopRatedMovies extends Failure {}

class FailureTopRatedMoviesDatasourceError implements FailureTopRatedMovies {
  @override
  final String message;
  final int errorCode;

  const FailureTopRatedMoviesDatasourceError({
    required this.message,
    this.errorCode = 500,
  });
}
