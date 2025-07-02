part of 'featured_movies_view_model.dart';

abstract class FeaturedMoviesState {}

class FeaturedMoviesLoading extends FeaturedMoviesState implements LoadingState {}

class FeaturedMoviesSuccess extends FeaturedMoviesState implements LoadedState {
  final List<MovieEntity> movies;
  FeaturedMoviesSuccess({this.movies = const []});
}

class FeaturedMoviesError extends FeaturedMoviesState implements ErrorState {
  @override
  final String message;
  FeaturedMoviesError(this.message);
}
