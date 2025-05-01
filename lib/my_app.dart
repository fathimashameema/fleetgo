import 'package:fleetgo/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fleetgo/bloc/email_verification_bloc/email_verification_bloc.dart';
import 'package:fleetgo/bloc/mobile_verififcation_bloc/mobile_verification_bloc.dart';
import 'package:fleetgo/bloc/navigate_home_bloc/navigate_home_bloc.dart';
import 'package:fleetgo/bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:fleetgo/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fleetgo/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:fleetgo/bloc/sms_email_checkBox_bloc/sms_email_check_box_bloc.dart';
import 'package:fleetgo/bloc/user_bloc/users_bloc.dart';
import 'package:fleetgo/bloc/user_exist_bloc/is_user_exist_bloc.dart';
import 'package:fleetgo/presentation/screens/auth/welcome.dart';
import 'package:fleetgo/presentation/screens/home/home_page.dart';
import 'package:fleetgo/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final UserRepo userRepository;
  final FirestoreRepo firestoreRepository;
  const MyApp(
      {super.key,
      required this.userRepository,
      required this.firestoreRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(myUserResporitory: userRepository),
        ),
        BlocProvider(
          create: (context) => SignInBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
              userRepository: userRepository,
              firestoreRepository: firestoreRepository),
        ),
        BlocProvider(
          create: (context) => UsersBloc(
              myUserRepository: userRepository,
              myFirestoreRepository: firestoreRepository),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityBloc(fieldCount: 2),
        ),
        BlocProvider(
          create: (context) => EmailVerificationBloc(
              firestoreRepository: firestoreRepository,
              userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) =>
              MobileVerificationBloc(myUserRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => NavigateHomeBloc(),
        ),
        BlocProvider(
          create: (context) => SmsEmailCheckBoxBloc(),
        ),
        BlocProvider(
          create: (context) => IsUserExistBloc(
            firestoreRepository: firestoreRepository,
          ),
        ),
      ],
      child: MaterialApp(
        theme: TAppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return const HomePage();
            } else {
              return const Welcome();
            }
          },
        ),
      ),
    );
  }
}
