part of 'is_user_exist_bloc.dart';

abstract class IsUserExistEvent extends Equatable {
  const IsUserExistEvent();

  @override
  List<Object> get props => [];
}

class IsUserExist extends IsUserExistEvent {
  final String userName;
  final String email;
  final String number;
  const IsUserExist({
    required this.userName,
    required this.email,
    required this.number,
  });
}

class ClearUserExistState extends IsUserExistEvent {}
