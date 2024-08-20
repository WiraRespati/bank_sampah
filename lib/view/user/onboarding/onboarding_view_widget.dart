import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class OnboardingViewWidget extends StatelessWidget {
  const OnboardingViewWidget({
    super.key,
    required this.assets,
    required this.title,
    required this.subtitle,
    this.height,
  });

  final String assets;
  final String title;
  final String subtitle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assets,
          // height: height ?? 214,
          width: double.infinity,
        ),
        const SizedBox(
          height: 31,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              AutoSizeText(
                title,
                style: TextStyleCollection.bodyBold.copyWith(
                  color: ColorPrimary.primary200,
                ),
                minFontSize: 16,
                maxFontSize: 18,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              AutoSizeText(
                subtitle,
                style: TextStyleCollection.caption.copyWith(
                  color: ColorPrimary.primary200,
                ),
                minFontSize: 14,
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
