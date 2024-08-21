import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/form_tambah_jadwal_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/tambah_jadwal_button_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahJadwalPage extends StatelessWidget {
  const TambahJadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KelolaHeaderWidget(
                  title: "Tambah Jadwal Bank",
                  onPressed: () {
                    Get.back();
                  },
                ),
                const FormTambahJadwalWidget()
              ],
            ),
          ),
          TambahJadwalButtonWidget(),
        ],
      ),
    );
  }
}
