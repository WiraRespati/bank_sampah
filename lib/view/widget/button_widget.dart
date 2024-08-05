import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.side,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.child,
  });

  final void Function()? onPressed;
  final BorderSide? side;
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: side ?? BorderSide.none,
        ),
        backgroundColor: backgroundColor ?? ColorPrimary.primary100,
        overlayColor: ColorNeutral.neutral200,
        shadowColor: ColorCollection.transparent,
      ),
      child: child ??
          AutoSizeText(
            text ?? '',
            style: TextStyleCollection.bodyBold.copyWith(
              color: textColor,
            ),
            minFontSize: 14,
            maxFontSize: 16,
          ),
    );
  }
}
