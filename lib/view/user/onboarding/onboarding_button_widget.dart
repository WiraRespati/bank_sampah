import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OnboardingButtonWidget extends StatelessWidget {
  const OnboardingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ButtonWidget(
          onPressed: () {
            Get.to(() =>  LoginPage());
          },
          text: 'Mari Menabung Sampah',
          textColor: ColorCollection.white,
          backgroundColor: ColorPrimary.primary100,
        ),
      ),
    );
  }
}
