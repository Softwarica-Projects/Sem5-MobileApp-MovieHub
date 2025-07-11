part of 'movie_detail_view_model.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState implements LoadingState {}

class MovieDetailLoaded extends MovieDetailState implements LoadedState {
  final MovieEntity movie;
  MovieDetailLoaded(this.movie);
}

class MovieDetailError extends MovieDetailState implements ErrorState {
  @override
  final String message;
  MovieDetailError(this.message);
}

class ToggleFavLoading extends MovieDetailState implements LoadingState {}

class ToggleFavSuccess extends MovieDetailState implements LoadedState {
  final String message;
  ToggleFavSuccess(this.message);
}

class ToggleFavError extends MovieDetailState implements LoadingState {}
