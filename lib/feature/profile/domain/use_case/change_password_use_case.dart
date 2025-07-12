import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';

class ChangePasswordUseCase implements UsecaseWithParams<String, ChangePasswordEntity> {
  final IAuthRepository _repository;

  ChangePasswordUseCase(this._repository);
  @override
  Future<Either<Exception, String>> call(ChangePasswordEntity data) async {
    try {
      var response = await _repository.changePassword(data);
      return Right(response);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
