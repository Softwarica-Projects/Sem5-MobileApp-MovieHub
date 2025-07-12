import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';

class UpdateUserUseCase implements UsecaseWithParams<String, UserEntity> {
  final IUserRepository _repository;

  UpdateUserUseCase(this._repository);
  @override
  Future<Either<Exception, String>> call(UserEntity data) async {
    try {
      var res = await _repository.updateUser(data);
      return Right(res);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
