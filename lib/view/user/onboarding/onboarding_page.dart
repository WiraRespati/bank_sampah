import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_button_widget.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_footer_widget.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_header_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            OnboardingHeaderWidget(),
            OnboardingButtonWidget(),
            OnboardingFooterWidget()
          ],
        ),
      ),
    );
  }
}
