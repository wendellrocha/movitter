import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/result_upcoming_movies.dart';

class ResultUpcomingMoviesModel extends ResultUpcomingMovies {
  final int page;
  final List<Movies> upcomingMovies;
  final int totalPages;
  final int totalResults;

  const ResultUpcomingMoviesModel({
    this.page = 1,
    this.upcomingMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  ResultUpcomingMoviesModel copyWith({
    int? page,
    List<Movies>? upcomingMovies,
    int? totalPages,
    int? totalResults,
  }) {
    return ResultUpcomingMoviesModel(
      page: page ?? this.page,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'upcomingMovies': upcomingMovies.map((x) => x.toJson()).toList(),
        'totalPages': totalPages,
        'totalResults': totalResults,
      };

  factory ResultUpcomingMoviesModel.fromJson(Map<String, dynamic> map) =>
      ResultUpcomingMoviesModel(
        page: map['page'] as int,
        upcomingMovies: List<Movies>.from(
          (map['results'] as List<dynamic>).map<Movies>(
            (x) => Movies.fromJson(x as Map<String, dynamic>),
          ),
        ),
        totalPages: map['total_pages'] as int,
        totalResults: map['total_results'] as int,
      );

  @override
  String toString() =>
      'ResultUpcomingMoviesModel(page: $page, upcomingMovies: $upcomingMovies, totalPages: $totalPages, totalResults: $totalResults)';

  @override
  bool operator ==(covariant ResultUpcomingMoviesModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.upcomingMovies, upcomingMovies) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        upcomingMovies.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
