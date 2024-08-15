import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/admin/edit_barang_controller.dart';

class FormEditBarangWidget extends StatelessWidget {
  FormEditBarangWidget({super.key});

  final EditBarangController editBarangController = Get.put(
    EditBarangController(),
  );

  @override
  Widget build(BuildContext context) {
    editBarangController.setBarang();
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
              controller: editBarangController.namaBarangController,
              errorText: editBarangController.errorMessageNamaBarang.value,
              onChanged: (String value) {
                editBarangController.validatorNamaBarang(value);
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
              controller: editBarangController.deskripsiBarangController,
              errorText: editBarangController.errorMessageDeskripsiBarang.value,
              onChanged: (String value) {
                editBarangController.validatorDeskripsiBarang(value);
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
              hintText: 'Masukkan Nilai Point Barang',
              keyboardType: TextInputType.number,
              controller: editBarangController.nilaiPointController,
              errorText: editBarangController.errorMessageNilaiPoint.value,
              onChanged: (String value) {
                editBarangController.validatorNilaiPoint(value);
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(
            () => TextFormFieldWidget(
              isPassword: false,
              titleForm: 'Jumlah Stok',
              hintText: 'Masukkan Jumlah Stok Barang',
              keyboardType: TextInputType.number,
              controller: editBarangController.jumlahStokController,
              errorText: editBarangController.errorMessageJumlahStok.value,
              onChanged: (String value) {
                editBarangController.validatorJumlahStok(value);
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
