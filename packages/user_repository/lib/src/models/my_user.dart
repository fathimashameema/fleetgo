import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String number;
  final String? profile;
  final String password;

  const MyUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.number,
      this.profile,
      required this.password});

  static const emptyUser = MyUser(
      id: '', email: '', name: '', number: '', profile: '', password: '');

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? number,
    String? profile,
    String? password,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profile: profile ?? this.profile,
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  bool get isEmpty => this == MyUser.emptyUser;
  bool get isNotEmpty => this != MyUser.emptyUser;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      number: number,
      profile: profile,
      password: password,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      profile: entity.profile,
      number: entity.number,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        number,
        profile,
        password,
      ];
}
