import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun?  ',
                style: TextStyleCollection.caption.copyWith(
                  fontSize: 12,
                  color: ColorNeutral.neutral700,
                ),
              ),
              GestureDetector(
                child: Text(
                  'Daftar',
                  style: TextStyleCollection.caption.copyWith(
                    fontSize: 12,
                    color: ColorPrimary.primary100,
                  ),
                ),
                onTap: () {
                  // Get.to(() => const RegisterPage());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
