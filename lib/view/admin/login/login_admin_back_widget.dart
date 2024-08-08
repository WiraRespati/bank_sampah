import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';

class LoginAdminBackWidget extends StatelessWidget {
  const LoginAdminBackWidget({super.key});

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
              // Get.to(() => const OnboardingPage());
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
