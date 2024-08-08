import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class LoginFooterAdminWidget extends StatelessWidget {
  const LoginFooterAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 18, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  'Sentuh Tombol Masuk untuk memulai managemen Bank Sampah',
                  style: TextStyleCollection.caption.copyWith(
                    fontSize: 12,
                    color: ColorNeutral.neutral700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
