import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FormTambahBarangWidget extends StatelessWidget {
  FormTambahBarangWidget({super.key});

  final BarangController barangController = Get.put(
    BarangController(),
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
              controller: barangController.namaBarangController,
              errorText: barangController.errorMessageNamaBarang.value,
              onChanged: (String value) {
                barangController.validatorNamaBarang(value);
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
              controller: barangController.nilaiPointController,
              errorText: barangController.errorMessageNilaiPoint.value,
              onChanged: (String value) {
                barangController.validatorNilaiPoint(value);
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
              controller: barangController.jumlahStokController,
              errorText: barangController.errorMessageJumlahStok.value,
              onChanged: (String value) {
                barangController.validatorJumlahStok(value);
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
