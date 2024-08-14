import 'package:bank_sampah/controller/admin/menabung_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadMenabungSampahWidget extends StatelessWidget {
  UploadMenabungSampahWidget({super.key, this.onTap, required this.title});

  final Function()? onTap;
  final String title;
  final controller = Get.put(MenabungSampahController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.setTapped(true),
      onTapUp: (_) {
        controller.setTapped(false);
        if (onTap != null) {
          onTap!();
        }
      },
      onTapCancel: () => controller.setTapped(false),
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 22),
          height: 65,
          decoration: BoxDecoration(
            color: controller.isTapped.value
                ? ColorPrimary.primary200
                : ColorPrimary.primary100,
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
                 title,
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
        ),
      ),
    );
  }
}
