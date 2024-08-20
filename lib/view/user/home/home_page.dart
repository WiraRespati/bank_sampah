import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/user/home/banner_home_widget.dart';
import 'package:bank_sampah/view/user/home/barang/barang_page.dart';
import 'package:bank_sampah/view/user/home/item_home_widget.dart';
import 'package:bank_sampah/view/user/home/sampah/sampah_page.dart';
import 'package:bank_sampah/view/user/home/title_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user/riwayat_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BarangController barangController = Get.put(
      BarangController(),
    );
    final EditSampahController sampahController = Get.put(
      EditSampahController(),
    );
    final RiwayatController riwayatController = Get.put(
      RiwayatController(),
    );
    riwayatController.getAllRiwayatKonversi();
    riwayatController.getAllRiwayatMenabung();
    barangController.getAllBarang();
    sampahController.getAllSampah();
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerHomeWidget(),
            TitleItemWidget(
              title: 'Sampah yang dapat ditabung',
              onPressed: () {
                Get.to(() => const SampahPage());
              },
            ),
            SizedBox(
              height: 210,
              child: Obx(() {
                final listSampah = sampahController.listSampah.value;
                if (listSampah == null || listSampah.isEmpty) {
                  return const Center(
                      child: Text('Tidak ada samapah tersedia'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final sampah = listSampah[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 15,
                        bottom: 10,
                      ),
                      child: ItemHomeWidget(
                        image: sampah.gambar,
                        title: sampah.name,
                        point: Helper.formatNumber(sampah.points!.toString()),
                        description: sampah.description,
                        date: Helper.formatTimestamp(sampah.createdAt),
                      ),
                    );
                  },
                );
              }),
            ),
            TitleItemWidget(
              title: 'Barang yang dapat ditukar',
              onPressed: () {
                Get.to(() => const BarangPage());
              },
            ),
            SizedBox(
              height: 210,
              child: Obx(() {
                final listBarang = barangController.listBarang.value;
                if (listBarang == null || listBarang.isEmpty) {
                  return const Center(child: Text('Tidak ada barang tersedia'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final barang = listBarang[index];

                    return Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 15,
                        bottom: 10,
                      ),
                      child: ItemHomeWidget(
                        image: barang.image,
                        title: barang.name,
                        point: Helper.formatNumber(barang.price!.toString()),
                        description: barang.description,
                        date: Helper.formatTimestamp(barang.createdAt),
                        stok: barang.stock.toString(),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
