part of 'genre_movie_list_view_model.dart';

abstract class GenreMovieListEvent {}

class FetchGenreMovies extends GenreMovieListEvent {
  final String? genreId;
  FetchGenreMovies(this.genreId);
}
