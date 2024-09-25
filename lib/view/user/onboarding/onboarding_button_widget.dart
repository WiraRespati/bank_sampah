import 'package:bank_sampah/controller/widget/onboarding_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingButtonWidget extends StatelessWidget {
  const OnboardingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );
    return Obx(
      () => onboardingController.currentPage.value == 2
          ? Positioned(
              bottom: 24,
              left: 19.5,
              right: 19.5,
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () async {
                    Get.offAll(() => LoginPage());
                    onboardingController.reset();
                  },
                  text: 'Mulai Menabung Sampah',
                  textColor: ColorCollection.white,
                  backgroundColor: ColorPrimary.primary100,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
