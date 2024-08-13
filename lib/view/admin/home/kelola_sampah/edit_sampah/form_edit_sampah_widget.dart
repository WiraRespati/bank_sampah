import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormEditSampahWidget extends StatelessWidget {
  FormEditSampahWidget({super.key});

  final EditSampahController sampahController = Get.put(
    EditSampahController(),
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
              titleForm: 'Nama Barang',
              hintText: 'Masukkan Nama Barang',
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
              titleForm: 'Deskripsi Barang',
              hintText: 'Masukkan Deskripsi Barang',
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
