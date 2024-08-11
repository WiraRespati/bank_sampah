import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilLogoutAlertDialog extends StatelessWidget {
  const ProfilLogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // final LogoutController logoutController = Get.put(LogoutController());
    return AlertDialog(
      backgroundColor: ColorNeutral.neutral50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 112,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPrimary.primary200),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Batal',
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorPrimary.primary100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                AuthService().signOut();
                Get.offAll(() => const SplashPage());
              },
              child: Container(
                width: 112,
                height: 48,
                decoration: BoxDecoration(
                  color: ColorDanger.danger400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Keluar',
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorCollection.whitishGray,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      title: Center(
        child: Text(
          'Keluar',
          style: TextStyleCollection.bodyBold
              .copyWith(color: ColorNeutral.neutral900, fontSize: 16),
        ),
      ),
      content: Text(
        'Apakah Anda yakin ingin keluar dari akun ini?',
        style: TextStyleCollection.caption.copyWith(fontSize: 14),
      ),
    );
  }
}
