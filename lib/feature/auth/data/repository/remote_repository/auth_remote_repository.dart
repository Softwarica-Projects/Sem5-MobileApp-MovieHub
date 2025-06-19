import 'package:dartz/dartz.dart';
import 'package:moviehub/feature/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:moviehub/feature/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/feature/auth/domain/model/user_model.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRemoteRepository(this._authRemoteDatasource);

  @override
  Future<UserModel> loginUser(LoginModel model) async {
    return await _authRemoteDatasource.loginUser(model);
  }

  @override
  Future<void> registerUser(SignupModel model) async {
    await _authRemoteDatasource.registerUser(model);
  }
}
