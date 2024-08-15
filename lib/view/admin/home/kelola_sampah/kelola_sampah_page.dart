import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/edit_sampah_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/tambah_sampah_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/widget/item_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaSampahPage extends StatelessWidget {
  const KelolaSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditSampahController editSampahController =
        Get.put(EditSampahController());
    editSampahController.getAllSampah();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const KelolaHeaderWidget(
              title: "Kelola Sampah",
            ),
            TambahSampahWidget(
              onTap: () {
                Get.to(() => TambahSampahPage());
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 23,
                      childAspectRatio: 0.65,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        editSampahController.listSampah.value?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 152,
                        height: 265,
                        child: ItemAdminWidget(
                          buttonName: 'Edit',
                          image: editSampahController
                              .listSampah.value![index].gambar,
                          title: editSampahController
                              .listSampah.value![index].name,
                          point: editSampahController
                              .listSampah.value![index].points
                              .toString(),
                          onPressed: () {
                            Get.to(() => const EditSampahPage());
                            editSampahController.sampah.value =
                                editSampahController.listSampah.value![index];
                          },
                        ),
                      );
                    },
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
