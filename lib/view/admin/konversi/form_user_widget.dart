import 'package:bank_sampah/controller/admin/konversi_controller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUserWidget extends StatelessWidget {
  const FormUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final KonversiController konversiController = Get.put(KonversiController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          TextFormFieldWidget(
            controller: konversiController.namaLengkapController,
            titleForm: 'Nama Lengkap',
            hintText: 'Nama Lengkap',
            isPassword: false,
            isEnabled: false,
          ),
          const SizedBox(height: 24),
          TextFormFieldWidget(
            controller: konversiController.pointsController,
            titleForm: 'Jumlah Point',
            hintText: 'Jumlah Point yang dimiliki',
            isEnabled: false,
            isPassword: false,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
