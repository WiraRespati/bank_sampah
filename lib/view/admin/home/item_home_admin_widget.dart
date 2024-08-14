// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/controller/admin/item_home_admin_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemHomeAdminWidget extends StatelessWidget {
  const ItemHomeAdminWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget? image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemHomeAdminController(), tag: title);

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
          margin: const EdgeInsets.only(right: 20,left: 20, top: 18,),
          height: 65,
          decoration: BoxDecoration(
            color: controller.isTapped.value
                ? ColorNeutral.neutral100
                : ColorNeutral.neutral50,
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
              Row(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ColorPrimary.primary100.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyleCollection.captionMedium.copyWith(
                            fontSize: 16,
                            color: ColorPrimary.primary100,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyleCollection.caption.copyWith(
                            fontSize: 12,
                            color: const Color(0xFF5A5A5A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorPrimary.primary100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
