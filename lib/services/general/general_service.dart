import 'package:moviehub/demodata.dart';
import 'package:moviehub/services/core/http_service.dart';

class GeneralService {
  final HttpService _httpService;

  GeneralService(this._httpService);

  Future<List<dynamic>> getGenres() async {
    await demoDelay();
    return [];
  }
}
