import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/feature/auth/data/data_source/auth_data_source.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class AuthRemoteDatasource implements IAuthDataSource {
  final HttpService _httpService;

  AuthRemoteDatasource(this._httpService);

  @override
  Future<AuthResponseEntity> loginUser(LoginEntity data) async {
    var response = await _httpService.postDataJson(
      ApiUrl.login,
      data: data.toMap(),
    );
    return AuthResponseEntity.fromMap(response);
  }

  @override
  Future<void> registerUser(SignupEntity data) async {
    await _httpService.postDataJson(
      ApiUrl.register,
      data: data.toMap(),
    );
  }

  @override
  Future<String> changePassword(ChangePasswordEntity data) async {
    var response = await _httpService.postDataJson(
      ApiUrl.changePassword,
      data: data.toMap(),
    );
    return response['message'].toString();
  }
}
