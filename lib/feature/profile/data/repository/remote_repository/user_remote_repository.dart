import 'package:moviehub/demodata.dart';
import 'package:moviehub/feature/profile/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource _dataSource;

  UserRemoteRepository(this._dataSource);

  @override
  Future<UserEntity> getUserInformation() async {
    return await _dataSource.getUserInformation();
  }

  @override
  Future<String> updateUser(UserEntity data) async {
    return await _dataSource.updateUser(data);
  }
}
