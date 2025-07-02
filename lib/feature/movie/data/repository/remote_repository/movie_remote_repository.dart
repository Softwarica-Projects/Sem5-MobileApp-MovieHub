import 'package:moviehub/feature/movie/data/data_source/movie_data_source.dart';
import 'package:moviehub/feature/movie/data/data_source/remote_datasource/movie_remote_datasource.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
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
  Future<List<MovieEntity>> getRecentlyAddedMovies() async {
    final movies = await _dataSource.getRecentlyAddedMovies();
    return movies;
  }
}
