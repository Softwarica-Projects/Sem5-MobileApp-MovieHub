import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviehub/core/constant/hive_table_constant.dart';
import 'package:moviehub/core/utility/exceptions/exception.dart';
import 'package:moviehub/feature/auth/data/data_source/auth_data_source.dart';
import 'package:moviehub/feature/auth/data/model/user_hive_model.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/profile/domain/entity/change_password_entity.dart';

class AuthLocalDatasource implements IAuthDataSource {
  final HiveInterface _hiveInterface;

  AuthLocalDatasource(this._hiveInterface);

  @override
  Future<AuthResponseEntity> loginUser(LoginEntity data) async {
    var box = await _hiveInterface.openBox<UserHiveModel>(HiveTableConstant.userTableBox);
    var user = box.values.firstWhereOrNull(
      (user) => user.email == data.email && user.password == data.password,
    );
    if (user != null) {
      var userData = user.toDomainModel();
      return AuthResponseEntity(token: "Local_token", id: userData.id, email: userData.email, name: userData.name);
    } else {
      throw InvalidCredentialsException('User with email ${data.email} not found or invalid credentials.');
    }
  }

  @override
  Future<void> registerUser(SignupEntity data) async {
    var box = await _hiveInterface.openBox<UserHiveModel>(HiveTableConstant.userTableBox);
    var user = box.values.firstWhereOrNull(
      (user) => user.email == data.email,
    );
    if (user != null) {
      throw AlreadyExistsException('User with email ${data.email} already exists');
    }
    var hiveModel = UserHiveModel.fromSignupModel(data);
    await box.put(hiveModel.id, hiveModel);
  }

  @override
  Future<String> changePassword(ChangePasswordEntity data) {
    throw UnimplementedError();
  }
}
