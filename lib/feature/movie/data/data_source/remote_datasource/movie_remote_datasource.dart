import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/feature/movie/data/data_source/movie_data_source.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/entity/rate_movie_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class MovieRemoteDataSource implements IMovieDataSource {
  final HttpService _httpService;

  MovieRemoteDataSource(this._httpService);

  @override
  Future<List<MovieEntity>> getFeaturedMovies() async {
    var response = await _httpService.getData(
      ApiUrl.featuredMovies,
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    var response = await _httpService.getData(
      ApiUrl.popularMovies,
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<List<MovieEntity>> getReleasingSoonMovies() async {
    var response = await _httpService.getData(
      ApiUrl.releasingSoonMovies,
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<List<MovieEntity>> getRecentlyAddedMovies() async {
    var response = await _httpService.getData(
      ApiUrl.recentlyAddedMovies,
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<List<MovieEntity>> searchMovie(String query, String? genreId) async {
    var response = await _httpService.getData(
      ApiUrl.searchMovie,
      data: {
        "query": query,
        "genreId": genreId,
      },
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<MovieEntity> getById(String id) async {
    var response = await _httpService.getData(
      ApiUrl.movieDetail(id),
    );
    return MovieEntity.fromMap(response);
  }

  @override
  Future<String> rateMovie(RateMovieEntity data) async {
    var response = await _httpService.postDataJson(
        ApiUrl.rateMovie(
          data.id,
        ),
        data: data.toMap());
    return response['message'].toString();
  }

  @override
  Future<void> markAsView(String id) async {
    await _httpService.postDataJson(ApiUrl.markMovieAsView(id), data: {"id": id});
  }
}
