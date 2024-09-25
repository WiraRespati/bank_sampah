import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void reset() {
    currentPage.value = 0;
    pageController.jumpToPage(0);
  }
}
