import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/result_movies_now_playing.dart';

class ResultMoviesNowPlayingModel extends ResultMoviesNowPlaying {
  final int page;
  final List<Movies> moviesNowPlaying;
  final int totalPages;
  final int totalResults;

  const ResultMoviesNowPlayingModel({
    this.page = 1,
    this.moviesNowPlaying = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  ResultMoviesNowPlayingModel copyWith({
    int? page,
    List<Movies>? moviesNowPlaying,
    int? totalPages,
    int? totalResults,
  }) =>
      ResultMoviesNowPlayingModel(
        page: page ?? this.page,
        moviesNowPlaying: moviesNowPlaying ?? this.moviesNowPlaying,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'page': page,
        'moviesNowPlaying': moviesNowPlaying.map((x) => x.toJson()).toList(),
        'totalPages': totalPages,
        'totalResults': totalResults,
      };

  factory ResultMoviesNowPlayingModel.fromJson(Map<String, dynamic> map) =>
      ResultMoviesNowPlayingModel(
        page: map['page'] as int,
        moviesNowPlaying: List<Movies>.from(
          (map['results'] as List<dynamic>).map<Movies>(
            (x) => Movies.fromJson(x as Map<String, dynamic>),
          ),
        ),
        totalPages: map['total_pages'] as int,
        totalResults: map['total_results'] as int,
      );

  @override
  String toString() =>
      'ResultMoviesNowPlayingModel(page: $page, moviesNowPlaying:'
      ' $moviesNowPlaying, totalPages: $totalPages, totalResults: $totalResults)';

  @override
  bool operator ==(covariant ResultMoviesNowPlayingModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.moviesNowPlaying, moviesNowPlaying) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        moviesNowPlaying.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
