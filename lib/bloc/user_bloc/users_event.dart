part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  List<Object?> get props => [];
}

class GetMyUser extends UsersEvent {
  final String userId;
  const GetMyUser({required this.userId});
  @override
  List<Object?> get props => [userId];
}
