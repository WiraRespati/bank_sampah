import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class ItemProfileWidget extends StatelessWidget {
  const ItemProfileWidget(
      {super.key, this.onTap, required this.title, required this.icon});

  final Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 32, right: 26),
        height: 70,
        decoration: BoxDecoration(
          color: ColorNeutral.neutral50,
          border: const Border(
            bottom: BorderSide(
              color: Color(0x801C9351),
              width: 1,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x331C9351),
              offset: Offset(0, 4),
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
                Icon(
                  icon,
                  size: 24,
                  color: ColorPrimary.primary100,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: TextStyleCollection.bodyMedium.copyWith(
                    fontSize: 16,
                    color: ColorPrimary.primary100,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorPrimary.primary100,
            ),
          ],
        ),
      ),
    );
  }
}
