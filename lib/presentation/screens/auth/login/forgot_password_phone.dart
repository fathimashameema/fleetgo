import 'package:fleetgo/presentation/screens/auth/login/forgot_password_email.dart';
import 'package:fleetgo/presentation/screens/auth/login/get_code.dart';
import 'package:fleetgo/presentation/widgets/page_heading.dart';
import 'package:fleetgo/presentation/widgets/reset_password_fields.dart';
import 'package:fleetgo/resources/colors/colors.dart';
import 'package:fleetgo/resources/icons/icons.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPhone extends StatefulWidget {
  const ForgotPasswordPhone({super.key});

  @override
  State<ForgotPasswordPhone> createState() => _ForgotPasswordPhoneState();
}

class _ForgotPasswordPhoneState extends State<ForgotPasswordPhone> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
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
            hintText: 'Mobile number',
            alternative: 'Search by Email or Username ',
            mailOrSms: 'SMS',
            navigateTo: const ForgotPasswordEmail(),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      if (numberController.text.isEmpty &&
                          usernameController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: const Text('Enter a response'),
                                content: const Text(
                                    'Please enter a Username,Email address or Mobile number to continue.'),
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
