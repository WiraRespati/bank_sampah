import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadMenabungSamphWidget extends StatelessWidget {
  const UploadMenabungSamphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 22),
      height: 65,
      decoration: BoxDecoration(
        color: ColorPrimary.primary100,
        border: Border.all(
          color: const Color(0xFFB6E0B1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: Text(
              'Upload Menabung Sampah',
              style: TextStyleCollection.captionMedium
                  .copyWith(fontSize: 16, color: ColorCollection.white),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: ColorCollection.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/logo_camera.svg",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
