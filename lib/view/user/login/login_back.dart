import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBack extends StatelessWidget {
  const LoginBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Get.to(() => const OnboardingPage());
            },
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
            ),
            icon: Icon(
              Icons.arrow_back,
              color: ColorPrimary.primary100,
            ),
          ),
        ),
      ],
    );
  }
}
