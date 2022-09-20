// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import '../../domain/entities/result_popular_movies.dart';
import 'popular_movies.dart';

class ResultPopularMoviesModel extends ResultPopularMovies {
  final int page;
  final List<PopularMovies> popularMovies;
  final int totalPages;
  final int totalResults;

  const ResultPopularMoviesModel({
    required this.page,
    required this.popularMovies,
    required this.totalPages,
    required this.totalResults,
  }) : super(
          page: page,
          popularMovies: popularMovies,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  ResultPopularMoviesModel copyWith({
    int? page,
    List<PopularMovies>? popularMovies,
    int? totalPages,
    int? totalResults,
  }) {
    return ResultPopularMoviesModel(
      page: page ?? this.page,
      popularMovies: popularMovies ?? this.popularMovies,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'popularMovies': popularMovies.map((x) => x.toJson()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory ResultPopularMoviesModel.fromJson(Map<String, dynamic> map) {
    return ResultPopularMoviesModel(
      page: map['page'] as int,
      popularMovies: map['results'] == null
          ? []
          : (map['results'] as List<dynamic>)
              .map((e) => PopularMovies.fromJson(e))
              .toList(),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }

  @override
  String toString() {
    return 'PopularMoviesModel(page: $page, popularMovies: $popularMovies,'
        ' totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(covariant ResultPopularMoviesModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.popularMovies, popularMovies) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        popularMovies.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
