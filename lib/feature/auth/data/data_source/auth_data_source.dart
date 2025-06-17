import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/feature/auth/domain/model/user_model.dart';

abstract interface class IAuthDataSource {
  Future<UserModel> loginUser(LoginModel data);
  Future<void> registerUser(SignupModel data);
}
