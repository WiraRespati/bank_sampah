import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/controller/admin/edit_barang_controller.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/edit_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/tambah_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/widget/item_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangPage extends StatelessWidget {
  const KelolaBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BarangController barangController = Get.put(
      BarangController(),
    );
    final EditBarangController editBarangController = Get.put(
      EditBarangController(),
    );
    barangController.getAllBarang();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const KelolaHeaderWidget(
              title: "Kelola Barang",
            ),
            TambahBarangWidget(
              onTap: () {
                Get.to(() => TambahBarangPage());
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                double childAspectRatio =
                    constraints.maxWidth > 600 ? 0.60 : 0.60;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: crossAxisCount == 4 ? 33 : 24,
                        childAspectRatio: childAspectRatio,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: barangController.listBarang.value?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ItemAdminWidget(
                            buttonName: 'Edit',
                            image:
                                barangController.listBarang.value?[index].image,
                            title:
                                barangController.listBarang.value?[index].name,
                            point: barangController
                                .listBarang.value?[index].price
                                .toString(),
                            onPressed: () {
                              Get.to(() => const EditBarangPage());
                              editBarangController.barang.value =
                                  barangController.listBarang.value?[index];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
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
