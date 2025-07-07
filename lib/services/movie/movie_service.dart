import 'package:moviehub/demodata.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/shared/model/movie_model.dart';

class MovieService {
  final HttpService _httpService;

  MovieService(this._httpService);

  Future<List<MovieEntity>> getMostPopular() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }

  Future<List<MovieEntity>> getRecentlyAdded() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }

  Future<List<MovieEntity>> getFeatured() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }

  Future<List<MovieEntity>> searchMovie(String query, int? genreId) async {
    await demoDelay();
    return movieData
        .where((element) =>
            (genreId == null ? true : element.genreId == genreId) &&
            (element.title.toLowerCase().contains(query.toLowerCase()) ||
                (element.description ?? "").toLowerCase().contains(
                      query.toLowerCase(),
                    )))
        .toList();
  }
}
