import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            "assets/images/logobs.png",
             height: 64,
          width: 64,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 27, left: 68, right: 68),
          child: SvgPicture.asset(
            'assets/images/title_bank_sampah.svg',
            height: 48,
            width: 225,
          ),
        ),
      ],
    );
  }
}
