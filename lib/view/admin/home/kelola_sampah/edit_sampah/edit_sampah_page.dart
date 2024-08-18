import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/button_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/form_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/upload_edit_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/admin/edit_sampah_controller.dart';

class EditSampahPage extends StatelessWidget {
  const EditSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditSampahController editSampahController =
        Get.put(EditSampahController());
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    KelolaHeaderWidget(
                      title: "Edit Data Sampah",
                      onPressed: () {
                        Get.back();
                        editSampahController.clearForm();
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
          Obx(
            () {
              if (editSampahController.isLoading.value) {
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
