import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RegisterBack extends StatelessWidget {
  const RegisterBack({super.key});

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
              Get.to(() => const LoginPage());
            },
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
            ),
            icon: Icon(
              Icons.arrow_back,
              color: ColorPrimary.primary200,
            ),
          ),
        ),
      ],
    );
  }
}
