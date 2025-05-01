import 'package:fleetgo/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                
                text: 'Book your ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextSpan(
                text: 'ride ',
                style: const TextStyle().copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: TColors.headingTexts,
                  fontFamily: 'adlam',
                ),
              ),
              TextSpan(
                text: 'in seconds,\n',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextSpan(
                text: 'Travel ',
                style: const TextStyle().copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: TColors.headingTexts,
                  fontFamily: 'adlam',
                ),
              ),
              TextSpan(
                text: 'without limits!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ]),
          ),
        )
      ],
    );
  }
}
