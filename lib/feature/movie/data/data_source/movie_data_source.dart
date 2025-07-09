import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/entity/rate_movie_entity.dart';

abstract interface class IMovieDataSource {
  Future<List<MovieEntity>> getFeaturedMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getRecentlyAddedMovies();
  Future<List<MovieEntity>> getReleasingSoonMovies();
  Future<List<MovieEntity>> searchMovie(String query, String? genreId);
  Future<MovieEntity> getById(String id);
  Future<String> rateMovie(RateMovieEntity data);
  Future<void> markAsView(String id);
}
