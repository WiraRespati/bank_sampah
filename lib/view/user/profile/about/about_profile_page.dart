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
Kami adalah mahasiswa dari Kelompok 6 Kuliah Kerja Nyata (KKN) Universitas Mulia, yang saat ini sedang menjalankan program KKN di Kelurahan Gunung Samarinda. Sebagai bagian dari pengabdian kami kepada masyarakat, kami menciptakan aplikasi bank sampah yang inovatif dengan tujuan meningkatkan kesadaran akan pentingnya menjaga lingkungan dan mengelola sampah dengan lebih baik.

""",
            ),
            ItemAboutWidget(
              title: 'Harapan Kami',
              description: """
Kami berharap aplikasi ini tidak hanya mempermudah Masyarakat dan Lembaga Pemberdayaan Masyarakat Kelurahan Gunung Samarinda dalam mengelola sampah, tetapi juga dapat menjadi pemicu semangat untuk lebih peduli terhadap lingkungan. Dengan adanya sistem penghargaan melalui poin, kami ingin memberikan motivasi tambahan bagi warga untuk terus berpartisipasi aktif dalam program bank sampah ini.
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
