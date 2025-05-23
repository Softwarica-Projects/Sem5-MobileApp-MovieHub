import 'package:moviehub/demodata.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/shared/model/genre_model.dart';

class GeneralService {
  final HttpService _httpService;

  GeneralService(this._httpService);

  Future<List<GenreModel>> getGenres() async {
    await demoDelay();
    return genreList;
  }
}
