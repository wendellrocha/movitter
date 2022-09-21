// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/result_trending_movies.dart';

class ResultTrendingMoviesModel extends ResultTrendingMovies {
  final int page;
  final List<Movies> trendingMovies;
  final int totalPages;
  final int totalResults;

  const ResultTrendingMoviesModel({
    this.page = 1,
    this.trendingMovies = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  ResultTrendingMoviesModel copyWith({
    int? page,
    List<Movies>? trendingMovies,
    int? totalPages,
    int? totalResults,
  }) {
    return ResultTrendingMoviesModel(
      page: page ?? this.page,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'trendingMovies': trendingMovies.map((x) => x.toJson()).toList(),
        'totalPages': totalPages,
        'totalResults': totalResults,
      };

  factory ResultTrendingMoviesModel.fromJson(Map<String, dynamic> map) =>
      ResultTrendingMoviesModel(
        page: map['page'] as int,
        trendingMovies: List<Movies>.from(
          (map['results'] as List<dynamic>).map<Movies>(
            (x) => Movies.fromJson(x as Map<String, dynamic>),
          ),
        ),
        totalPages: map['total_pages'] as int,
        totalResults: map['total_results'] as int,
      );

  @override
  String toString() =>
      'TrendingMoviesModel(page: $page, trendingMovies: $trendingMovies,'
      ' totalPages: $totalPages, totalResults: $totalResults)';

  @override
  bool operator ==(covariant ResultTrendingMoviesModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.trendingMovies, trendingMovies) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        trendingMovies.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
