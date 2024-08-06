import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah punya akun? ',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 12,
              color: ColorNeutral.neutral700,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const LoginPage());
            },
            child: Text(
              'Masuk',
              style: TextStyleCollection.caption.copyWith(
                fontSize: 12,
                color: ColorPrimary.primary100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
