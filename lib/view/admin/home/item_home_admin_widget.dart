// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemHomeAdminWidget extends StatelessWidget {
  const ItemHomeAdminWidget({super.key, required this.title, required this.subtitle, required this.image});

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      height: 65,
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
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
                    color: const Color(0xFF1C9351).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      image,
                      height: 32,
                      width: 32,
                      color: ColorPrimary.primary100,
                    ),
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorPrimary.primary100,
              ))
        ],
      ),
    );
  }
}
