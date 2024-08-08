import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class LoginBannerAdminWidget extends StatelessWidget {
  const LoginBannerAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          Text(
            'Masuk Akun Admin',
            style: TextStyleCollection.bodyBold.copyWith(
              fontSize: 16,
              color: ColorNeutral.neutral900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ayo! Managemen Bank Sampah Kita',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral700,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
