import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';

abstract interface class IAuthDataSource {
  Future<AuthResponseEntity> loginUser(LoginEntity data);
  Future<void> registerUser(SignupEntity data);
  Future<String> changePassword(ChangePasswordEntity data);
}
