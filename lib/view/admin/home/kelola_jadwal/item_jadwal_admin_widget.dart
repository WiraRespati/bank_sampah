import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class ItemJadwalAdminWidget extends StatelessWidget {
  const ItemJadwalAdminWidget({
    super.key,
    this.onPressed,
    this.day,
    this.openTime,
    this.closedTime,
  });

  final Function()? onPressed;
  final String? day;
  final String? openTime;
  final String? closedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, right: 20,left: 20),
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
        border: const Border(
          bottom: BorderSide(
            color: Color(0x801C9351),
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x331C9351),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: ColorPrimary.primary100,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day ?? 'Hari',
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 16,
                      color: ColorCollection.black,
                    ),
                  ),
                  Text(
                    (openTime != null && closedTime != null)
                        ? "$openTime - $closedTime"
                        : "09:00 - 13:00",
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorCollection.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: ColorPrimary.primary100,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
