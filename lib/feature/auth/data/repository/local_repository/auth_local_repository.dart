import 'package:moviehub/feature/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDatasource _authLocalDatasource;

  AuthLocalRepository(this._authLocalDatasource);

  @override
  Future<AuthResponseEntity> loginUser(LoginEntity model) async {
    return await _authLocalDatasource.loginUser(model);
  }

  @override
  Future<void> registerUser(SignupEntity model) async {
    await _authLocalDatasource.registerUser(model);
  }

  @override
  Future<String> changePassword(ChangePasswordEntity model) {
    throw UnimplementedError();
  }
}
