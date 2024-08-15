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
      body: Column(
        children: [
          const BarangAppbar(),
          Expanded(
            child: Obx(() {
              final listBarang = barangController.listBarang.value;
              if (listBarang == null || listBarang.isEmpty) {
                return const Center(child: Text('Tidak ada barang tersedia'));
              }
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.77,
                ),
                itemCount: listBarang.length,
                itemBuilder: (context, index) {
                  final barang = listBarang[index];
                  return Center(
                    child: ItemHomeWidget(
                      image: barang.image,
                      title: barang.name,
                      point: Helper.formatNumber(barang.price!.toString()),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
