// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/controller/admin/riwayat_konversi_controller.dart';
import 'package:bank_sampah/controller/admin/riwayat_menabung_controller.dart';
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
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RiwayatMenabungController riwayatMenabungController =
        Get.put(RiwayatMenabungController());

    final RiwayatKonversiController riwayatKonversiController =
        Get.put(RiwayatKonversiController());
    riwayatMenabungController.getAllRiwayat();
    riwayatKonversiController.getAllRiwayatKonversi();
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
              image: SvgPicture.asset(
                "assets/images/logo_manage_barang.svg",
                color: ColorPrimary.primary100,
              ),
              onTap: () {
                Get.to(() => const KelolaBarangPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Kelola Sampah',
              subtitle: 'Edit dan Tambahkan Sampah',
              image: SvgPicture.asset(
                "assets/images/logo_manage_sampah.svg",
                color: ColorPrimary.primary100,
              ),
              onTap: () {
                Get.to(() => const KelolaSampahPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Riwayat Menabung',
              subtitle: 'Riwayat Menabung Sampah',
              image: Image.asset(
                "assets/images/menabungsampahicon.png",
                height: 24,
                width: 24,
                color: ColorPrimary.primary100,
              ),
              onTap: () {
                Get.to(() => const RiwayatMenabungPage());
              },
            ),
            ItemHomeAdminWidget(
              title: 'Riwayat Konversi',
              subtitle: 'Riwayat Konversi Point',
              image: Image.asset(
                "assets/images/konversipointicon.png",
                height: 24,
                width: 24,
                color: ColorPrimary.primary100,
              ),
              onTap: () {
                Get.to(() => RiwayatKonversiPage());
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
