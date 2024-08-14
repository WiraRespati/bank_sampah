import 'package:bank_sampah/controller/admin/add_sampah_controller.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/button_tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/form_tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/upload_tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color_constant.dart';

class TambahSampahPage extends StatelessWidget {
   TambahSampahPage({super.key});
final AddSampahController addSampahController = Get.put(
    AddSampahController(),
  );
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
          ButtonTambahSampahWidget(),
          Obx(
            () {
              if (addSampahController.isLoadingAddSampah.value) {
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
