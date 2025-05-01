import 'package:fleetgo/presentation/screens/auth/login/password_changed.dart';
import 'package:fleetgo/presentation/widgets/input_box.dart';
import 'package:fleetgo/presentation/widgets/page_heading.dart';
import 'package:fleetgo/resources/icons/icons.dart';
import 'package:flutter/material.dart';

class SetNewPass extends StatelessWidget {
  const SetNewPass({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: TIcons.backButton),
        title: const PageHeading(
          mainHeading: 'Create new password',
          subHeading: 'Reset your password',
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 80,
          ),
          InputBox(hintText: 'Password', textController: usernameController),
          InputBox(
              hintText: 'Confirm password', textController: passwordController),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              'Both passwords must match',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const PasswordChanged()));
                    },
                    child: const Text('Reset'))),
          )
        ],
      )),
    );
  }
}
