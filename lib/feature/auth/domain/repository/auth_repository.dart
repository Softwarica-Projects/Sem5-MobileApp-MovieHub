import 'package:dartz/dartz.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/feature/auth/domain/model/user_model.dart';

abstract interface class IAuthRepository {
  Future<UserModel> loginUser(LoginModel model);
  Future<void> registerUser(SignupModel model);
}
