// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenreEntity {
  final String id;
  final String name;
  final String? image;
  GenreEntity({
    required this.id,
    required this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(
      id: map['_id'] as String,
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreEntity.fromJson(String source) => GenreEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenreEntity(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant GenreEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
