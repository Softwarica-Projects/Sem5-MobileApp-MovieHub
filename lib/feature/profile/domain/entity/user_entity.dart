import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserEntity {
  final String? imageUrl;
  final String id;
  final String name;
  final String email;
  UserEntity({
    this.imageUrl,
    required this.id,
    required this.name,
    required this.email,
  });

  UserEntity copyWith({
    String? imageUrl,
    String? id,
    String? name,
    String? email,
  }) {
    return UserEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      imageUrl: map['image'] != null ? map['image'] as String : null,
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserEntity(imageUrl: $imageUrl, id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.imageUrl == imageUrl && other.id == id && other.name == name && other.email == email;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^ id.hashCode ^ name.hashCode ^ email.hashCode;
  }
}
