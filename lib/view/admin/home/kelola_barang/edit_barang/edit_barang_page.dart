import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/alert_delete_widget.dart';
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
        Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  KelolaHeaderWidget(
                    title: "Edit Data Barang",
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorPrimary.primary100.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDeleteWidget(
                                      title: 'Hapus Barang',
                                      description:
                                          "Apakah Anda yakin ingin menghapus barang?",
                                      onDelete: () {
                                        editBarangController.deleteBarang();
                                      },
                                    ));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: ColorPrimary.primary100,
                          ),
                        ),
                      ),
                    ),
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
        ),
        Obx(
          () {
            if (editBarangController.isLoading.value) {
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
    ));
  }
}
