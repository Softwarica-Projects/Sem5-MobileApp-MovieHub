import 'package:moviehub/demodata.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/services/core/http_service.dart';

class AuthService {
  final HttpService _httpService;

  AuthService(this._httpService);

  Future<dynamic> login(LoginModel model) async {
    await demoDelay();
    return {"access_token": "dsd"};
  }

  Future<dynamic> register(SignupModel model) async {
    await demoDelay();
    return "done";
  }
}
