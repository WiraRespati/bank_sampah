import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/user/home/item_home_widget.dart';
import 'package:bank_sampah/view/user/home/sampah/sampah_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampahPage extends StatelessWidget {
  const SampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditSampahController sampahController = Get.put(
      EditSampahController(),
    );
    sampahController.getAllSampah();
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Column(
        children: [
          const SampahAppbar(),
          Expanded(
            child: Obx(() {
              final listBarang = sampahController.listSampah.value;
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
                  final sampah = listBarang[index];
                  return Center(
                    child: ItemHomeWidget(
                      image: sampah.gambar,
                      title: sampah.name,
                      point: Helper.formatNumber(sampah.points!.toString()),
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