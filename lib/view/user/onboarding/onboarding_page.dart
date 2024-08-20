import 'package:bank_sampah/controller/widget/onboarding_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_back.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_button_widget.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_skip.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: (index) {
              onboardingController.onPageChanged(index);
            },
            children: const [
              OnboardingViewWidget(
                assets: 'assets/images/onboarding1.png',
                title: 'Mari Menabung Sampah di Bank Sampah!',
                subtitle:
                    'Bergabunglah dengan kami untuk menjaga lingkungan dengan menabung sampah Anda.',
              ),
              OnboardingViewWidget(
                assets: 'assets/images/banner_home.png',
                title: 'Tukar Point Menjadi Uang, Sembako, dll!',
                subtitle:
                    'Kumpulkan poin dari menabung sampah dan tukarkan dengan berbagai hadiah menarik.',
              ),
              OnboardingViewWidget(
                assets: 'assets/images/gedunglpm.png',
                title: 'Tabung Sampahmu dan Tukar Pointmu di Gedung LPM!',
                subtitle:
                    'Kunjungi Gedung LPM untuk menabung sampah dan menukar poin Anda dengan berbagai hadiah menarik.',
              ),
            ],
          ),
          const OnboardingSkip(),
          const OnboardingBack(),
          Container(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(
              controller: onboardingController.pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: ColorNeutral.neutral200,
                activeDotColor: ColorSecondary.secondary500,
              ),
            ),
          ),
          const OnboardingButtonWidget()
        ],
      ),
    );
  }
}
