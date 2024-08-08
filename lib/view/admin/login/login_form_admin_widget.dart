import 'package:bank_sampah/controller/admin/login_admin_contolller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormAdminWidget extends StatelessWidget {
  LoginFormAdminWidget({super.key});

  final LoginAdminController loginController = Get.put(
    LoginAdminController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Email',
              hintText: 'Masukkan email anda',
              keyboardType: TextInputType.emailAddress,
              controller: loginController.emailController,
              errorText: loginController.errorMessageEmail.value,
              isPassword: false,
              onChanged: (String value) {
                loginController.validatorEmail(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Kata sandi',
              hintText: 'Masukkan kata sandi anda',
              keyboardType: TextInputType.text,
              controller: loginController.passwordController,
              errorText: loginController.errorMessagePassword.value,
              isPassword: true,
              onChanged: (String value) {
                loginController.validatorPassword(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
