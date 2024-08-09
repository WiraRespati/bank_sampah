import 'package:bank_sampah/controller/user/register_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterBack extends StatelessWidget {
  RegisterBack({super.key});

  final RegisterController registerController = Get.put(
    RegisterController(),
  );

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
              Get.to(() => LoginPage());
              registerController.clearText();
            },
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
            ),
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorPrimary.primary200,
            ),
          ),
        ),
      ],
    );
  }
}
