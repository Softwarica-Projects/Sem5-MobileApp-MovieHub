import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviehub/core/constant/hive_table_constant.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/user_entity.dart';
import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableUd)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;

  factory UserHiveModel.fromSignupModel(SignupEntity model) {
    return UserHiveModel(
      model.name,
      model.email,
      model.password,
    );
  }
  UserHiveModel(this.name, this.email, this.password) : id = Uuid().v4();
//
  UserEntity toDomainModel() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
    );
  }

  @override
  List<Object?> get props => [id, name, email, password];
}
