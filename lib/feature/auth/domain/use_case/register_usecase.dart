import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/auth/domain/model/signup_model.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements UsecaseWithParams<void, SignupModel> {
  final IAuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  @override
  Future<Either<Exception, void>> call(SignupModel params) async {
    try {
      await authRepository.registerUser(params);
      return Right(null);
    } on Exception catch (e) {
      return Future.value(Left(e));
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
