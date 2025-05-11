import 'package:eventhub/demodata.dart';
import 'package:eventhub/services/core/http_service.dart';

class AuthService {
  final HttpService _httpService;

  AuthService(this._httpService);

  Future<dynamic> login(String email, String password) async {
    await demoDelay();
    return {"access_token": "dsd"};
  }

  Future<dynamic> register(String name, String email, String password) async {
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
