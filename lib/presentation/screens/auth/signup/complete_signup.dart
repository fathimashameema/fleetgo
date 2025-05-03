import 'package:fleetgo/presentation/screens/home/home_page.dart';
import 'package:fleetgo/resources/colors/colors.dart';
import 'package:fleetgo/resources/images/images.dart';
import 'package:flutter/material.dart';

class CompleteSignup extends StatelessWidget {
  const CompleteSignup({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const HomePage()),
          (route) => false);
      // context.read<NavigateHomeBloc>().add(const NavigateToHome());
    });
    // return BlocListener<NavigateHomeBloc, NavigateHomeState>(
    //   listener: (context, state) {
    //     if (state is NavigateHomeSuccess) {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (ctx) => const HomePage()),
    //           (route) => false);
    //     }
    //   },
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Welcome',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextSpan(
                  text: '@user',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: TColors.headingTexts),
                )
              ])),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      TImages.checkMark,
                      width: screenWidth * 0.7,
                      // height: screenHeight * 0.5,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        'Congratulation on your sign up. Get your cab at comfort!!',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
