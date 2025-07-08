// ignore_for_file: public_member_api_docs, sort_constructors_first

class RateMovieEntity {
  final String id;
  final double rating;
  final String review;
  RateMovieEntity({
    required this.id,
    required this.rating,
    required this.review,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'review': review,
    };
  }
}
