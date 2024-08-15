import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/button_edit_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/form_edit_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/upload_edit_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/admin/edit_barang_controller.dart';

class EditBarangPage extends StatelessWidget {
  const EditBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditBarangController editBarangController = Get.put(
      EditBarangController(),
    );
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              KelolaHeaderWidget(
                title: "Edit Data Barang",
                onPressed: () {
                  Get.back();
                  editBarangController.clearData();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FormEditBarangWidget(),
              UploadEditBarangWidget(),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
        const ButtonEditWidget(),
      ],
    ));
  }
}
