part of 'is_user_exist_bloc.dart';

sealed class IsUserExistState extends Equatable {
  const IsUserExistState();

  @override
  List<Object> get props => [];
}

final class IsUserExistInitial extends IsUserExistState {}

class UserExist extends IsUserExistState {
  final bool isUserExist;
  final String error;
  const UserExist(this.isUserExist, this.error);
}
