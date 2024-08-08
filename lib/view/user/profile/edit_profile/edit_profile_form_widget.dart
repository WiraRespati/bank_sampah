import 'package:bank_sampah/controller/user/edit_profile_controller.dart';
import 'package:bank_sampah/view/user/profile/edit_profile/edit_profil_radio_button.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileFormWidget extends StatelessWidget {
  EditProfileFormWidget({super.key});

  final ProfileController editController = Get.put(
    ProfileController(),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () => TextFormFieldWidget(
              keyboardType: TextInputType.name,
              titleForm: 'Nama Pengguna',
              hintText: 'Masukkan nama anda',
              isPassword: false,
              controller: editController.namaLengkapController,
              errorText: editController.errorMessageNamaLengkap.value,
              onChanged: (value) {
                editController.validatorNamaLengkap(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              keyboardType: TextInputType.number,
              titleForm: 'Nomor Telepon',
              hintText: 'Nomor Telepon anda',
              isPassword: false,
              controller: editController.nomorTeleponController,
              errorText: editController.errorMessageNomorTelepon.value,
              onChanged: (value) {
                editController.validatorNomorTelepon(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              keyboardType: TextInputType.name,
              titleForm: 'Ubah Password',
              hintText: 'Ubah Password anda',
              isPassword: false,
              controller: editController.editPasswordController,
              errorText: editController.errorMessageEditPassword.value,
              onChanged: (value) {
                editController.validatorEditPassword(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          const EditProfilRadioButton(),
        ],
      ),
    );
  }
}
