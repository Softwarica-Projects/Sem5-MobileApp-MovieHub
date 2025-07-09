part of 'genre_movie_list_view_model.dart';

abstract class GenreMovieListState {}

class GenreMovieListInitial extends GenreMovieListState {}

class GenreMovieListLoading extends GenreMovieListState implements LoadingState {}

class GenreMovieListLoaded extends GenreMovieListState implements LoadedState {
  final List<MovieEntity> movies;
  GenreMovieListLoaded(this.movies);
}

class GenreMovieListError extends GenreMovieListState implements ErrorState {
  @override
  final String message;
  GenreMovieListError(this.message);
}
