import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/feature/genre/data/data_source/genre_data_source.dart';
import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class GenreRemoteDataSource implements IGenreDataSource {
  final HttpService _httpService;

  GenreRemoteDataSource(this._httpService);

  @override
  Future<List<GenreEntity>> getGenreList() async {
    var response = await _httpService.getData(
      ApiUrl.genreList,
    );
    return (response as List<dynamic>).map((x) => GenreEntity.fromMap(x)).toList();
  }
}
