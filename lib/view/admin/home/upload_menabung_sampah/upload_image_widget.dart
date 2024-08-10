import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(
                "Foto Sampah",
                style: TextStyleCollection.bodyBold.copyWith(
                  color: ColorCollection.black,
                ),
                minFontSize: 16,
                maxFontSize: 18,
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: ColorCollection.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.25),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
              height: 324,
              width: 324,
              child: Center(
                child: Icon(
                  Icons.add_a_photo,
                  color: ColorPrimary.primary100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
