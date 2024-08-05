import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class OnboardingFooterWidget extends StatelessWidget {
  const OnboardingFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 47),
      child: Column(
        children: [
          Text(
            "Created by",
            style: TextStyleCollection.caption.copyWith(
              color: ColorPrimary.primary100,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "KKN Kelompok 6 Gunung Samarinda Gelombang 3",
            style: TextStyleCollection.caption.copyWith(
              color: ColorPrimary.primary100,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
