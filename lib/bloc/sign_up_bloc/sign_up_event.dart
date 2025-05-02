part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class SignUpEmail extends SignUpEvent {
  final MyUser user;
  final String password;
  final String mailOrPhone;
  const SignUpEmail(this.user, this.password, this.mailOrPhone);
}

class SignUpPhone extends SignUpEvent {
  final String smsOtp;
  final MyUser user;

  const SignUpPhone({required this.user, required this.smsOtp});
}

class GoogleSignIn extends SignUpEvent {
  const GoogleSignIn();
}


