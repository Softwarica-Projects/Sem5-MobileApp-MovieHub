// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/core/utility/environment.dart';

import 'package:moviehub/shared/model/cast_model.dart';
import 'package:moviehub/shared/model/review_model.dart';

class MovieEntity {
  final String id;
  final String genreId;
  final String genre;
  final String? movieLink;
  final String? trailerLink;
  final int runtime;
  final String releaseDate;
  final double averageRating;
  final String coverImage;
  final String title;
  final String movieType;
  final String? description;
  final List<CastModel> cast;
  final List<ReviewModel> ratings;
  final bool isFavourite;
  MovieEntity({
    required this.id,
    required this.isFavourite,
    required this.genreId,
    required this.genre,
    this.movieLink,
    this.trailerLink,
    required this.runtime,
    required this.releaseDate,
    required this.averageRating,
    required this.coverImage,
    required this.title,
    required this.movieType,
    this.description,
    required this.cast,
    required this.ratings,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    try {
      var image = map['coverImage'] as String? ?? "";
      if (image.isNotEmpty && !image.startsWith('http')) {
        image = "${getEnvironment.domainUrl}$image";
      }
      return MovieEntity(
        isFavourite: (map['isFavourite'] ?? false),
        id: map['_id'] as String,
        genreId: map['genre'] == null ? "" : (map['genre'] is String ? map['genre'] : map['genre']['name']),
        genre: map['genreName'] ?? "",
        movieLink: map['movieLink'] != null ? map['movieLink'] as String : null,
        trailerLink: map['trailerLink'] != null ? map['trailerLink'] as String : null,
        runtime: map['runtime'] as int,
        releaseDate: map['releaseDate'] as String,
        averageRating: double.tryParse(map['averageRating']?.toString() ?? "") ?? 0.0,
        coverImage: image,
        title: map['title'] as String,
        movieType: map['movieType'] as String,
        description: map['description'] != null ? map['description'] as String : null,
        cast: List<CastModel>.from(
          (map['cast'] as List<dynamic>).map<CastModel>(
            (x) => CastModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        ratings: List<ReviewModel>.from(
          (map['ratings'] as List<dynamic>).map<ReviewModel>(
            (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );
    } catch (ex) {
      rethrow;
    }
  }

  factory MovieEntity.fromJson(String source) => MovieEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieEntity(id: $id, genreId: $genreId, genre: $genre, movieLink: $movieLink, trailerLink: $trailerLink, runtime: $runtime, releaseDate: $releaseDate, averageRating: $averageRating, coverImage: $coverImage, title: $title, movieType: $movieType, description: $description, cast: $cast, ratings: $ratings)';
  }

  @override
  bool operator ==(covariant MovieEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.genreId == genreId &&
        other.genre == genre &&
        other.movieLink == movieLink &&
        other.trailerLink == trailerLink &&
        other.runtime == runtime &&
        other.releaseDate == releaseDate &&
        other.averageRating == averageRating &&
        other.coverImage == coverImage &&
        other.title == title &&
        other.movieType == movieType &&
        other.description == description &&
        listEquals(other.cast, cast) &&
        listEquals(other.ratings, ratings);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        genreId.hashCode ^
        genre.hashCode ^
        movieLink.hashCode ^
        trailerLink.hashCode ^
        runtime.hashCode ^
        releaseDate.hashCode ^
        averageRating.hashCode ^
        coverImage.hashCode ^
        title.hashCode ^
        movieType.hashCode ^
        description.hashCode ^
        cast.hashCode ^
        ratings.hashCode;
  }
}
