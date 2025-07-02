import 'package:moviehub/demodata.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class AuthService {
  final HttpService _httpService;

  AuthService(this._httpService);

  Future<dynamic> login(LoginEntity model) async {
    await demoDelay();
    return {"access_token": "dsd"};
  }

  Future<dynamic> register(SignupEntity model) async {
    await demoDelay();
    return "done";
  }
}
