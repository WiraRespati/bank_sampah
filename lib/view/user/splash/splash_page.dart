import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:bank_sampah/view/user/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/bottom_navbar_admin/bottom_navbar_admin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Ganti dengan navigasi ke halaman berikutnya
      // cek user apakah sudah login atau belum
      AuthService().user == null
          ? Get.offAll(() => const OnboardingPage())
          : AuthService().checkAdmin().then((value) {
              if (value) {
                Get.offAll(() => BottomNavbarAdmin());
              } else {
                Get.offAll(() => BottomNavbar());
              }
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            "assets/images/logo_splash.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
