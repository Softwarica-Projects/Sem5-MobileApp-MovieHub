import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/core/constant/hive_table_constant.dart';
import 'package:moviehub/core/utility/exceptions/exception.dart';
import 'package:moviehub/feature/auth/data/data_source/auth_data_source.dart';
import 'package:moviehub/feature/auth/data/model/user_hive_model.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/feature/auth/domain/model/user_model.dart';
import 'package:moviehub/services/core/http_service.dart';

class AuthRemoteDatasource implements IAuthDataSource {
  final HttpService _httpService;

  AuthRemoteDatasource(this._httpService);

  @override
  Future<UserModel> loginUser(LoginModel data) async {
    var response = await _httpService.postRequestWithoutAuth(ApiUrl.login, data: data.toMap());
    return UserModel.fromMap(response);
  }

  @override
  Future<void> registerUser(SignupModel data) async {
    await _httpService.postRequestWithoutAuth(ApiUrl.register, data: data.toMap());
  }
}
