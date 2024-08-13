import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/button_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/form_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/upload_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSampahPage extends StatelessWidget {
  const EditSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                KelolaHeaderWidget(
                  title: "Edit Data Sampah",
                  onPressed: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FormEditSampahWidget(),
                UploadEditSampahWidget(),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
          const ButtonEditSampahWidget(),
        ],
      ),
    );
  }
}
