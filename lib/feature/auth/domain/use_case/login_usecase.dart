import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/services/core/preference_service.dart';

class LoginUsecase implements UsecaseWithParams<void, LoginEntity> {
  final IAuthRepository authRepository;
  final PreferenceService preferenceService;
  LoginUsecase(this.preferenceService, this.authRepository);

  @override
  Future<Either<Exception, AuthResponseEntity>> call(LoginEntity params) async {
    try {
      var user = await authRepository.loginUser(params);
      throw ("DD");
      preferenceService.username = user.name;
      preferenceService.accessToken = user.token;
      return Right(user);
    } on Exception catch (e) {
      return Future.value(Left(e));
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
