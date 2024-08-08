import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonAdminWidget extends StatelessWidget {
  const LoginButtonAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () async {
            Get.offAll(BottomNavbarAdmin());
          },
          text: 'Masuk',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}
