import 'package:moviehub/feature/movie/data/data_source/remote_datasource/movie_remote_datasource.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/entity/rate_movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class MovieRemoteRepository implements IMovieRepository {
  final MovieRemoteDataSource _dataSource;

  MovieRemoteRepository(this._dataSource);

  @override
  Future<List<MovieEntity>> getFeaturedMovies() async {
    final movies = await _dataSource.getFeaturedMovies();
    return movies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final movies = await _dataSource.getPopularMovies();
    return movies;
  }

  @override
  Future<List<MovieEntity>> getReleasingSoonMovies() async {
    final movies = await _dataSource.getReleasingSoonMovies();
    return movies;
  }

  @override
  Future<List<MovieEntity>> getRecentlyAddedMovies() async {
    final movies = await _dataSource.getRecentlyAddedMovies();
    return movies;
  }

  @override
  Future<List<MovieEntity>> searchMovie(String query, String? genreId) async {
    final movies = await _dataSource.searchMovie(query, genreId);
    return movies;
  }

  @override
  Future<MovieEntity> getById(String id) async {
    final movie = await _dataSource.getById(id);
    return movie;
  }

  @override
  Future<String> rateMovie(RateMovieEntity data) async {
    final response = await _dataSource.rateMovie(data);
    return response;
  }

  @override
  Future<void> markAsView(String id) async {
    await _dataSource.markAsView(id);
  }
}
