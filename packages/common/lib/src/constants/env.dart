class Env {
  static const String apiKey =
      String.fromEnvironment('TMDB_API_KEY', defaultValue: '');
}
