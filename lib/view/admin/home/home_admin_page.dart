import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/item_home_admin_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_samph_widget.dart';
import 'package:bank_sampah/view/user/profile/about/banner_about_widget.dart';
import 'package:flutter/material.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: const Column(
        children: [
          BannerAboutWidget(),
          UploadMenabungSamphWidget(),
          ItemHomeAdminWidget(
            title: 'Kelola Barang',
            subtitle: 'Edit dan Tambahkan Barang',
            image: "assets/images/logo_manage_barang.svg",
          ),
          ItemHomeAdminWidget(
            title: 'Kelola Sampah',
            subtitle: 'Edit dan Tambahkan Sampah',
            image: "assets/images/logo_manage_sampah.svg",
          ),
          ItemHomeAdminWidget(
            title: 'Kelola User',
            subtitle: 'Edit dan Hapus User',
            image: "assets/images/logo_profile.svg",
          ),
        ],
      ),
    );
  }
}
