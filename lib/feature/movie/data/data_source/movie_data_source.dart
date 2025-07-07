import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

abstract interface class IMovieDataSource {
  Future<List<MovieEntity>> getFeaturedMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getRecentlyAddedMovies();
  Future<List<MovieEntity>> searchMovie(String query, String? genreId);
}
