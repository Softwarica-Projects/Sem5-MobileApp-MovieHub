import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/feature/favourite/data/data_source/favourite_data_source.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class FavouriteRemoteDataSource implements IFavouriteDataSource {
  final HttpService _httpService;

  FavouriteRemoteDataSource(this._httpService);

  @override
  Future<List<MovieEntity>> getFavourites() async {
    var response = await _httpService.getData(
      ApiUrl.getFavouriteMovies,
    );
    return (response as List<dynamic>).map((x) => MovieEntity.fromMap(x)).toList();
  }

  @override
  Future<String> toggleFavourite(String id) async {
    var response = await _httpService.postDataJson(ApiUrl.toggleFavourite(id), data: {"id": id});
    return response['message'].toString();
  }
}
