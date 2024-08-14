import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/button_tambah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/form_tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/upload_tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahBarangPage extends StatelessWidget {
  TambahBarangPage({super.key});

  final BarangController barangController = Get.put(
    BarangController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                KelolaHeaderWidget(
                  title: "Tambah Barang",
                  onPressed: () {
                    barangController.clearData();
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FormTambahBarangWidget(),
                UploadTambahBarangWidget(),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
          ButtonTambahWidget(),
          Obx(
            () {
              if (barangController.isLoadingAddBarang.value) {
                return Container(
                  color: ColorNeutral.neutral50.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary100,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
