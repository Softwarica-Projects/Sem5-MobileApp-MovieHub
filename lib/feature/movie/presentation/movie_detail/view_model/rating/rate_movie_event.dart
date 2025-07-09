part of 'rate_movie_view_model.dart';

abstract class RateMovieEvent {}

class SubmitRating extends RateMovieEvent {
  final double rating;
  final String description;
  SubmitRating({required this.rating, required this.description});
}
