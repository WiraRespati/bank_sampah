import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/controller/admin/edit_barang_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/edit_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/tambah_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/widget/item_admin_widget.dart';
import 'package:bank_sampah/view/widget/show_modal_buttom_widget.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    double screenHeight = MediaQuery.of(context).size.height;
                    double childAspectRatio = screenHeight > 800 ? 0.69 : 0.60;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () {
                          if (barangController.listBarang.value?.isEmpty ??
                              true) {
                            return Center(
                                child: Text(
                              'Belum ada barang tersedia',
                              style: TextStyleCollection.bodyMedium.copyWith(
                                fontSize: 16,
                                color: ColorPrimary.primary100,
                              ),
                            ));
                          } else {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: crossAxisCount == 4 ? 33 : 24,
                                childAspectRatio: childAspectRatio,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  barangController.listBarang.value?.length ??
                                      0,
                              itemBuilder: (context, index) {
                                final barang =
                                    barangController.listBarang.value?[index];
                                return Center(
                                  child: ItemAdminWidget(
                                    buttonName: 'Edit',
                                    image: barang!.image,
                                    title: barang.name,
                                    point: Helper.formatNumber(
                                        barang.price!.toString()),
                                    onPressed: () {
                                      Get.to(() => const EditBarangPage());
                                      editBarangController.barang.value =
                                          barangController
                                              .listBarang.value?[index];
                                    },
                                    onTapItem: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return ShowModalButtomWidget(
                                            title: barang.name,
                                            image: barang.image,
                                            point: Helper.formatNumber(
                                                barang.price!.toString()),
                                            description: barang.description,
                                            date: Helper.formatTimestamp(
                                                barang.createdAt),
                                                stok: barang.stock.toString(),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
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
        ],
      ),
    );
  }
}
