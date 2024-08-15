import 'package:bank_sampah/controller/user/splash_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
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
