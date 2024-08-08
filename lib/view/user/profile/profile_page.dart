import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:bank_sampah/view/user/profile/about/about_profile_page.dart';
import 'package:bank_sampah/view/user/profile/banner_profile_widget.dart';
import 'package:bank_sampah/view/user/profile/edit_profile/edit_profile_page.dart';
import 'package:bank_sampah/view/user/profile/item_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerProfileWidget(),
            ItemProfileWidget(
              title: 'Ubah Informasi Profil',
              logo: 'assets/images/logo_settings.svg',
              onTap: () {
                Get.to(() => EditProfilePage());
              },
            ),
            ItemProfileWidget(
              title: 'Tentang Aplikasi',
              logo: 'assets/images/logo_about.svg',
              onTap: () {
                Get.to(() => const AboutProfilePage());
              },
            ),
            ItemProfileWidget(
              title: 'Keluar dari Akun',
              logo: 'assets/images/logo_exit.svg',
              onTap: () {
                Get.to(() => LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
