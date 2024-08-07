import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/profile/banner_profile_widget.dart';
import 'package:bank_sampah/view/user/profile/item_profile_widget.dart';
import 'package:flutter/material.dart';

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
              onTap: () {},
            ),
            ItemProfileWidget(
              title: 'Tentang Aplikasi',
              logo: 'assets/images/logo_about.svg',
              onTap: () {},
            ),
            ItemProfileWidget(
              title: 'Keluar dari Akun',
              logo: 'assets/images/logo_exit.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
