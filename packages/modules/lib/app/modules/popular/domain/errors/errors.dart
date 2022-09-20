abstract class FailurePopularMovies implements Exception {
  String get message;

  @override
  String toString() => message;
}

class PopularMoviesDatasourceError implements FailurePopularMovies {
  @override
  final String message;
  final int errorCode;

  const PopularMoviesDatasourceError({
    required this.message,
    this.errorCode = 500,
  });
}
