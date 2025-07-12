// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';

class AuthResponseEntity extends UserEntity {
  final String token;
  AuthResponseEntity({required this.token, required super.id, required super.email, required super.name});

  factory AuthResponseEntity.fromMap(Map<String, dynamic> map) {
    var user = UserEntity.fromMap(map);
    return AuthResponseEntity(
      token: map['token'] as String,
      email: user.email,
      id: user.id,
      name: user.name,
    );
  }

  factory AuthResponseEntity.fromJson(String source) => AuthResponseEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
