import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';

abstract interface class IAuthRepository {
  Future<AuthResponseEntity> loginUser(LoginEntity model);
  Future<void> registerUser(SignupEntity model);
  Future<String> changePassword(ChangePasswordEntity model);
}
