import 'package:eventhub/demodata.dart';
import 'package:eventhub/services/core/http_service.dart';

class UserService {
  final HttpService _httpService;

  UserService(this._httpService);

  Future<List<dynamic>> getMostPopular() async {
    await demoDelay();
    return [];
  }

  Future<List<dynamic>> getRecentlyAdded() async {
    await demoDelay();
    return [];
  }

  Future<List<dynamic>> getFeatured() async {
    await demoDelay();
    return [];
  }

  Future<dynamic> getDetailById(int id) async {
    await demoDelay();
    return {};
  }

  Future<List<dynamic>> searchMovie(String query, int? genreId) async {
    await demoDelay();
    return [];
  }

  Future<String> changePassword(String oldPassword, String newPassword) async {
    await demoDelay();
    return "Changed";
    // var dataToSend = {
    //   "current_password": oldPassword,
    //   "new_password": newPassword,
    //   "new_password_confirmation": newPassword,
    // };
    // var data = await _httpService.putDataJson(ApiUrl.changePassword, data: dataToSend);
    // return data['message'];
  }

  Future<String> markAsView(int movieId) async {
    await demoDelay();
    return "done";
    // var dataToSend = user.toMap();
    // if (user.image != null) {
    //   dataToSend.addAll({
    //     'image': await MultipartFile.fromFile(user.image!),
    //   });
    // }
    // var data = await _httpService.postDataFormData(ApiUrl.register, data: dataToSend);
    // return data['message'];
  }

  Future<String> rate(int movieId, double rating, String decsriptipn) async {
    await demoDelay();
    return "done";
    // var dataToSend = user.toMap();
    // if (user.image != null) {
    //   dataToSend.addAll({
    //     'image': await MultipartFile.fromFile(user.image!),
    //   });
    // }
    // var data = await _httpService.postDataFormData(ApiUrl.register, data: dataToSend);
    // return data['message'];
  }
}
