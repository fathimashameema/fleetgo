import 'package:fleetgo/bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:fleetgo/presentation/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.identifierController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController identifierController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputBox(
              keyboard: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Username,Email or Mobile number to login';
                }
                return null;
              },
              hintText: 'User name,Email or Mobile number',
              textController: identifierController),
          BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityChange>(
            builder: (context, state) {
              int index = 0;
              return InputBox(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password to login';
                  }
                  return null;
                },
                obscureText: state.isObscureList[index],
                hintText: 'Password',
                textController: passwordController,
                iconSuffix: GestureDetector(
                  onTap: () => context
                      .read<PasswordVisibilityBloc>()
                      .add(TogglePasswordVisibility(index)),
                  child: Icon(
                    state.isObscureList[index]
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 15,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
