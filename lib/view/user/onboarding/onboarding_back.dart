import 'package:bank_sampah/controller/widget/onboarding_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingBack extends StatelessWidget {
  const OnboardingBack({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Positioned(
      top: 40,
      left: 11.5,
      child: Obx(
        () => onboardingController.currentPage.value != 0
            ? IconButton(
                onPressed: () {
                  onboardingController.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
                ),
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPrimary.primary100,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
