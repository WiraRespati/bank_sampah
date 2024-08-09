import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/profile/about/banner_about_widget.dart';
import 'package:bank_sampah/view/user/profile/about/item_about_widget.dart';
import 'package:flutter/material.dart';

class AboutProfilePage extends StatelessWidget {
  const AboutProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BannerAboutWidget(),
            ItemAboutWidget(
              title: 'Tentang Kami',
              description: """
Bank Sampah Gunung Samarinda Kelompok 6 KKN Gunung Samarinda
Introduction: Bank Sampah Gunung Samarinda adalah sebuah inisiatif yang diinisiasi oleh Kelompok 6 KKN Gunung Samarinda. Program ini bertujuan untuk meningkatkan kesadaran masyarakat tentang pentingnya pengelolaan sampah yang baik dan berkelanjutan. Melalui upaya ini, kami berharap dapat membantu menciptakan lingkungan yang lebih bersih dan sehat di Gunung Samarinda.
""",
            ),
            ItemAboutWidget(
              title: 'Harapan Kami',
              description: """
Bank Sampah Gunung Samarinda Kelompok 6 KKN Gunung Samarinda
Introduction: Bank Sampah Gunung Samarinda adalah sebuah inisiatif yang diinisiasi oleh Kelompok 6 KKN Gunung Samarinda. Program ini bertujuan untuk meningkatkan kesadaran masyarakat tentang pentingnya pengelolaan sampah yang baik dan berkelanjutan. Melalui upaya ini, kami berharap dapat membantu menciptakan lingkungan yang lebih bersih dan sehat di Gunung Samarinda.
""",
            ),
            ItemAboutWidget(
              title: 'Hubungi Kami',
              description: """
Alamat: Gedung LPM Gunung Samrinda
Telepon: 085390978080
Email: Yayu@gmail.com
Media Sosial: BankSampahGunungSamarinda

Mari bergabung dengan kami dan jadilah bagian dari perubahan menuju Gunung Samarinda yang lebih bersih dan hijau!
""",
            ),
          ],
        ),
      ),
    );
  }
}
