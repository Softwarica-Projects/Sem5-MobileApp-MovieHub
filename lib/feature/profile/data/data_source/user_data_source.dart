import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';

abstract interface class IUserDataSource {
  Future<UserEntity> getUserInformation();
  Future<String> updateUser(UserEntity data);
}
