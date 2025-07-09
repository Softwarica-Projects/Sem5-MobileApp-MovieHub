import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';

class GetUserUseCase implements UsecaseWithoutParams<UserEntity> {
  final IUserRepository _repository;

  GetUserUseCase(this._repository);
  @override
  Future<Either<Exception, UserEntity>> call() async {
    try {
      var res = await _repository.getUserInformation();
      return Right(res);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
