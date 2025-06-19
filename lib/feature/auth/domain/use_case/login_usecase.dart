import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/model/user_model.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/services/core/preference_service.dart';

class LoginUsecase implements UsecaseWithParams<void, LoginModel> {
  final IAuthRepository authRepository;
  final PreferenceService preferenceService;
  LoginUsecase(this.preferenceService, this.authRepository);

  @override
  Future<Either<Exception, UserModel>> call(LoginModel params) async {
    try {
      var user = await authRepository.loginUser(params);
      preferenceService.username = user.name;
      // preferenceService.accessToken = "data['token']";
      return Right(user);
    } on Exception catch (e) {
      return Future.value(Left(e));
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
