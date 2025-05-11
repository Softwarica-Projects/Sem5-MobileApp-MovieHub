import 'package:eventhub/demodata.dart';
import 'package:eventhub/services/core/http_service.dart';

class GeneralService {
  final HttpService _httpService;

  GeneralService(this._httpService);

  Future<List<dynamic>> getGenres() async {
    await demoDelay();
    return [];
  }
}
