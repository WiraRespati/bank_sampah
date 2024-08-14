import 'package:bank_sampah/controller/admin/add_sampah_controller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTambahSampahWidget extends StatelessWidget {
  FormTambahSampahWidget({super.key});

  final AddSampahController sampahController = Get.put(
    AddSampahController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () => TextFormFieldWidget(
              isPassword: false,
              titleForm: 'Nama Sampah',
              hintText: 'Masukkan Nama Sampah',
              keyboardType: TextInputType.name,
              controller: sampahController.namaSampahController,
              errorText: sampahController.errorMessageNamaSampah.value,
              onChanged: (String value) {
                sampahController.validatorNamaSampah(value);
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(
            () => TextFormFieldWidget(
              isPassword: false,
              titleForm: 'Deskripsi Sampah',
              hintText: 'Masukkan Deskripsi Sampah',
              keyboardType: TextInputType.multiline,
              controller: sampahController.deskripsiSampahController,
              errorText: sampahController.errorMessageDeskripsiSampah.value,
              onChanged: (String value) {
                sampahController.validatorDeskripsiSampah(value);
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(
            () => TextFormFieldWidget(
              isPassword: false,
              titleForm: 'Nilai Point',
              hintText: 'Masukkan Nilai Point Sampah',
              keyboardType: TextInputType.number,
              controller: sampahController.nilaiPointSampahController,
              errorText: sampahController.errorMessageNilaiPointSampah.value,
              onChanged: (String value) {
                sampahController.validatorNilaiPointSampah(value);
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
