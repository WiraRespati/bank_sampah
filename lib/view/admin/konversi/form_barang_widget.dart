import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/konversi_controller.dart';

class FormBarangWidget extends StatelessWidget {
  const FormBarangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final KonversiController konversiController = Get.put(KonversiController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          TextFormFieldWidget(
              controller: konversiController.namaBarangController,
              titleForm: 'Nama Barang',
              hintText: 'Nama Barang',
              isEnabled: false,
              isPassword: false),
          const SizedBox(height: 24),
          TextFormFieldWidget(
              controller: konversiController.hargaBarangController,
              titleForm: 'Harga Barang',
              hintText: 'Harga Barang',
              isEnabled: false,
              isPassword: false),
          const SizedBox(height: 24),
          TextFormFieldWidget(
              controller: konversiController.stockBarangController,
              titleForm: 'Stok Barang',
              hintText: 'Jumlah Stok Barang yang tersedia',
              isEnabled: false,
              isPassword: false),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
