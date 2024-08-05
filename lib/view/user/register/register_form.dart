import 'package:bank_sampah/controller/user/register_controller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final RegisterController registerController = Get.put(
    RegisterController(),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'NIK',
              hintText: 'Masukkan NIK anda',
              keyboardType: TextInputType.number,
              controller: registerController.nikController,
              errorText: registerController.errorMessageNIK.value,
              isPassword: false,
              onChanged: (String value) {
                registerController.validatorNIK(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Nama Lengkap',
              hintText: 'Masukkan nama lengkap anda',
              keyboardType: TextInputType.name,
              controller: registerController.nameController,
              errorText: registerController.errorMessageName.value,
              isPassword: false,
              onChanged: (String value) {
                registerController.validatorName(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Email',
              hintText: 'Masukkan email anda',
              keyboardType: TextInputType.emailAddress,
              controller: registerController.emailController,
              errorText: registerController.errorMessageEmail.value,
              isPassword: false,
              onChanged: (String value) {
                registerController.validatorEmail(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Kata sandi',
              hintText: 'Masukkan kata sandi anda',
              keyboardType: TextInputType.text,
              controller: registerController.passwordController,
              errorText: registerController.errorMessagePassword.value,
              isPassword: true,
              onChanged: (String value) {
                registerController.validatorPassword(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
