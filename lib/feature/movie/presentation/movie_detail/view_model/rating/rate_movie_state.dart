part of 'rate_movie_view_model.dart';

abstract class RateMovieState {}

class RateMovieInitial extends RateMovieState {}

class RateMovieLoading extends RateMovieState {}

class RateMovieSuccess extends RateMovieState {}

class RateMovieError extends RateMovieState {
  final String message;
  RateMovieError(this.message);
}
