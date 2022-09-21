import 'package:common/common.dart';

abstract class FailureMoviesNowPlaying implements Failure {}

class MoviesNowPlayingDatasourceError implements FailureMoviesNowPlaying {
  @override
  final String message;
  final int errorCode;

  const MoviesNowPlayingDatasourceError({
    required this.message,
    this.errorCode = 500,
  });
}
