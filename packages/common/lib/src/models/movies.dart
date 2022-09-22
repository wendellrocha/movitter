import 'package:collection/collection.dart';
import 'package:dependencies/dependencies.dart';

class Movies {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const Movies({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  String toString() {
    return 'Movies(adult: $adult, backdropPath: $backdropPath,'
        ' genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage,'
        ' originalTitle: $originalTitle, overview: $overview, popularity:'
        ' $popularity, posterPath: $posterPath, releaseDate: $releaseDate,'
        ' title: $title, video: $video, voteAverage: $voteAverage, voteCount:'
        ' $voteCount)';
  }

  factory Movies.fromJson(Map<String, dynamic> data) => Movies(
        adult: data['adult'] as bool,
        backdropPath: data['backdrop_path'] as String?,
        genreIds: List<int>.from(data['genre_ids']),
        id: data['id'] as int,
        originalLanguage: data['original_language'] as String,
        originalTitle: data['original_title'] as String,
        overview: data['overview'] as String,
        popularity: (data['popularity'] as num).toDouble(),
        posterPath: data['poster_path'] as String?,
        releaseDate: DateFormat('d LLL yyyy')
            .format(DateTime.parse(data['release_date'] as String)),
        title: data['title'] as String,
        video: data['video'] as bool,
        voteAverage: (data['vote_average'] as num).toDouble(),
        voteCount: data['vote_count'] as int,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  Movies copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movies(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Movies) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      adult.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
}
