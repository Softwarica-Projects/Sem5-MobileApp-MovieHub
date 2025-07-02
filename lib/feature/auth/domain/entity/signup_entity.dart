// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignupEntity {
  final String email;
  final String name;
  final String password;
  SignupEntity({
    required this.email,
    required this.name,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
    };
  }
}
