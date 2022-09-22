import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/result_top_rated_movies.dart';

class ResultTopRatedMoviesModel extends ResultTopRatedMovies {
  final int page;
  final List<Movies> topRatedMovies;
  final int totalPages;
  final int totalResults;

  const ResultTopRatedMoviesModel({
    this.page = 1,
    this.topRatedMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  ResultTopRatedMoviesModel copyWith({
    int? page,
    List<Movies>? topRatedMovies,
    int? totalPages,
    int? totalResults,
  }) {
    return ResultTopRatedMoviesModel(
      page: page ?? this.page,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'page': page,
      'topRatedMovies': topRatedMovies.map((x) => x.toJson()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory ResultTopRatedMoviesModel.fromJson(Map<String, dynamic> map) {
    return ResultTopRatedMoviesModel(
      page: map['page'] as int,
      topRatedMovies: List<Movies>.from(
        (map['results'] as List<dynamic>).map<Movies>(
          (x) => Movies.fromJson(x as Map<String, dynamic>),
        ),
      ),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }

  @override
  bool operator ==(covariant ResultTopRatedMoviesModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.topRatedMovies, topRatedMovies) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        topRatedMovies.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
