import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';

abstract interface class IUserRepository {
  Future<UserEntity> getUserInformation();
  Future<String> updateUser(UserEntity data);
}
