import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/widgets.dart';

class RegisterBanner extends StatelessWidget {
  const RegisterBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          Text(
            'Buat Akun baru',
            style: TextStyleCollection.bodyBold.copyWith(
              fontSize: 16,
              color: ColorNeutral.neutral900,
            ),
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }
}
