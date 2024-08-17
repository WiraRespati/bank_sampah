import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/user/home/barang/barang_appbar.dart';
import 'package:bank_sampah/view/user/home/item_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarangPage extends StatelessWidget {
  const BarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BarangController barangController = Get.put(
      BarangController(),
    );
    barangController.getAllBarang();
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BarangAppbar(),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                double childAspectRatio =
                    constraints.maxWidth > 600 ? 0.60 : 0.60;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisCount == 4 ? 33 : 24,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemCount: barangController.listBarang.value?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final barang =
                            barangController.listBarang.value?[index];
                        return Center(
                          child: ItemHomeWidget(
                            image: barang?.image,
                            title: barang?.name,
                            point:
                                Helper.formatNumber(barang!.price.toString()),
                            description: barang.description,
                            date: Helper.formatTimestamp(barang.createdAt),
                            stok: barang.stock.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
