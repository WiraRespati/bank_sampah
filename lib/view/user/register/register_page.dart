import 'package:bank_sampah/controller/user/register_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/register/register_back.dart';
import 'package:bank_sampah/view/user/register/register_banner.dart';
import 'package:bank_sampah/view/user/register/register_button.dart';
import 'package:bank_sampah/view/user/register/register_footer.dart';
import 'package:bank_sampah/view/user/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(
      RegisterController(),
    );
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RegisterBack(),
                  const RegisterBanner(),
                  RegisterForm(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterButton(
                    onPressed: () {
                      registerController.register();
                    },
                  ),
                  const SizedBox(height: 16),
                  const RegisterFooter(),
                  const SizedBox(height: 19),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
