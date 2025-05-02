import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String number;
  final String? profile;
  final String password;

  const MyUserEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.number,
      this.profile,
      required this.password});

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'number': number,
      'profile': profile,
      'password': password,
    };
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      profile: doc['profile'] as String,
      number: doc['number'] as String,
      password: doc['password'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, email, profile, password];

  @override
  String toString() {
    return 'MyUserEntity(id: $id, email: $email, name: $name,number:$number, profile: $profile , password:$password)';
  }
}
