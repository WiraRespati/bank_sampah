import 'package:flutter/material.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  const OnboardingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboarding_image.jpg',
        ),
        Container(
          padding: const EdgeInsets.only(top: 26, bottom: 7),
          child: Image.asset(
            'assets/images/logobanksampah.jpg',
            height: 64,
            width: 64,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 27),
          child: Image.asset(
            'assets/images/banksampah_title.jpg',
            height: 48,
            width: 225,
          ),
        ),
      ],
    );
  }
}
