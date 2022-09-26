import 'package:common/common.dart';

abstract class FailureUpcomingMovies implements Failure {}

class UpcomingMoviesDatasourceError implements FailureUpcomingMovies {
  @override
  final String message;
  final int errorCode;

  const UpcomingMoviesDatasourceError({
    this.errorCode = 500,
    required this.message,
  });
}
