import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/button_tambah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/form_tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/upload_tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahSampahPage extends StatelessWidget {
  const TambahSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                KelolaHeaderWidget(
                  title: "Tambah Sampah",
                  onPressed: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FormTambahSampahWidget(),
                UploadTambahSampahWidget(),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
          // perhatikan ini
          const ButtonTambahWidget(),
        ],
      ),
    );
  }
}
