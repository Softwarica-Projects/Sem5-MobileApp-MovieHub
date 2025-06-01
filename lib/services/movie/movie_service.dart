import 'package:moviehub/demodata.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/shared/model/movie_model.dart';

class MovieService {
  final HttpService _httpService;

  MovieService(this._httpService);

  Future<List<MovieModel>> getMostPopular() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }

  Future<List<MovieModel>> getRecentlyAdded() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }

  Future<List<MovieModel>> getFeatured() async {
    await demoDelay();
    var tt = [...movieData];
    tt.shuffle();
    return tt.take(5).toList();
  }
}
