part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityEvent extends Equatable {
  final int fieldIndex;

  const PasswordVisibilityEvent(this.fieldIndex);

  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends PasswordVisibilityEvent {
  const TogglePasswordVisibility(super.fieldIndex);
}
