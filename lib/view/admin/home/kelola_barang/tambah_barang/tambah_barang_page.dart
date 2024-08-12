import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/button_tambah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/form_tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/upload_tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahBarangPage extends StatelessWidget {
  const TambahBarangPage({super.key});

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
          const ButtonTambahWidget(),
        ],
      ),
    );
  }
}
