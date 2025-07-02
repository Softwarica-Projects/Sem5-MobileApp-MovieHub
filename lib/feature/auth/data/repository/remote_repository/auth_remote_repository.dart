import 'package:moviehub/feature/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/user_entity.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRemoteRepository(this._authRemoteDatasource);

  @override
  Future<AuthResponseEntity> loginUser(LoginEntity model) async {
    return await _authRemoteDatasource.loginUser(model);
  }

  @override
  Future<void> registerUser(SignupEntity model) async {
    await _authRemoteDatasource.registerUser(model);
  }
}
