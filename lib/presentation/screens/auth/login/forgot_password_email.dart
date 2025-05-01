import 'package:fleetgo/presentation/screens/auth/login/forgot_password_phone.dart';
import 'package:fleetgo/presentation/screens/auth/login/get_code.dart';
import 'package:fleetgo/presentation/widgets/page_heading.dart';
import 'package:fleetgo/presentation/widgets/reset_password_fields.dart';
import 'package:fleetgo/resources/colors/colors.dart';
import 'package:fleetgo/resources/icons/icons.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmail extends StatefulWidget {
  const ForgotPasswordEmail({super.key});

  @override
  State<ForgotPasswordEmail> createState() => _ForgotPasswordEmailState();
}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: TIcons.backButton),
        title: const PageHeading(
          mainHeading: 'Forgot password?!',
          subHeading: 'Restore your account',
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 80,
          ),
          ResetPasswordFields(
            usernameController: usernameController,
            screenWidth: screenWidth,
            hintText: 'Email or Username',
            alternative: 'Search by Mobile number',
            mailOrSms: 'email',
            navigateTo:const ForgotPasswordPhone(),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      if (usernameController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: const Text('Enter a response'),
                                content: const Text(
                                    'Please enter a Username,Email address or search by Mobile number to continue.'),
                                actions: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          side: BorderSide(
                                              color: TColors.transparent)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Try again'))
                                ],
                              );
                            });
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const GetCode()));
                      }
                    },
                    child: const Text('Continue'))),
          )
        ],
      )),
    );
  }
}
