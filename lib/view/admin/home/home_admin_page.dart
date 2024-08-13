import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/banner_home_admin_widget.dart';
import 'package:bank_sampah/view/admin/home/item_home_admin_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/kelola_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/kelola_sampah_page.dart';
import 'package:bank_sampah/view/admin/home/riwayat_konversi/riwayat_konversi_page.dart';
import 'package:bank_sampah/view/admin/home/riwayat_menabung/riwayat_menabung_page.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/upload_menabung_sampah_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerHomeAdminWidget(),
            UploadMenabungSampahWidget(
              title: 'Upload Menabung Sampah',
              onTap: () {
                Get.to(() => UploadMenabungSampahPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Kelola Barang',
              subtitle: 'Edit dan Tambahkan Barang',
              image: "assets/images/logo_manage_barang.svg",
              onTap: () {
                Get.to(() => const KelolaBarangPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Kelola Sampah',
              subtitle: 'Edit dan Tambahkan Sampah',
              image: "assets/images/logo_manage_sampah.svg",
              onTap: () {
                Get.to(() => const KelolaSampahPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Riwayat Menabung',
              subtitle: 'Riwayat Menabung Sampah',
              image: "assets/images/logo_manage_sampah.svg",
              onTap: () {
                Get.to(() => const RiwayatMenabungPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Riwayat Konversi',
              subtitle: 'Riwayat Konversi Point',
              image: "assets/images/logo_manage_sampah.svg",
              onTap: () {
                Get.to(() => const RiwayatKonversiPage());
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
