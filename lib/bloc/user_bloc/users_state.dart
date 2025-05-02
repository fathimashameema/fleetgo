part of 'users_bloc.dart';

enum UserStatus { success, failure, loading }

class UsersState extends Equatable {
  final MyUser? user;
  final UserStatus status;

  const UsersState._({
    this.status = UserStatus.loading,
    this.user,
  });

  const UsersState.loading() : this._();
  const UsersState.success(MyUser user)
      : this._(status: UserStatus.success, user: user);
  const UsersState.failure() : this._(status: UserStatus.failure);

  @override
  List<Object?> get props => [status, user];
}
