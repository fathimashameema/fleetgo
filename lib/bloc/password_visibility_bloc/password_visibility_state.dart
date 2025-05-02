part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityState extends Equatable {
  const PasswordVisibilityState();

  @override
  List<Object> get props => [];
}

final class PasswordVisibilityInitial extends PasswordVisibilityState {}

final class PasswordVisibilityChange extends PasswordVisibilityState {
  final List<bool> isObscureList;
  const PasswordVisibilityChange({required this.isObscureList});
  @override
  List<Object> get props => [isObscureList];
}
