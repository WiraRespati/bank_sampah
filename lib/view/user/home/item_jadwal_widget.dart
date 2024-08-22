import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ItemJadwalWidget extends StatelessWidget {
  const ItemJadwalWidget({
    super.key,
    this.day,
    this.openTime,
    this.closedTime,
  });

  final String? day;
  final String? openTime;
  final String? closedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
        border: Border.all(
          color: const Color(0xFFB6E0B1),
          width: 1,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB6E0B1).withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/gedunglpm.png',
            ),
          ),
          Positioned(
            bottom: 12,
            left: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bank Sampah Buka',
                  style: TextStyle(
                    color: ColorCollection.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  (day == null || openTime == null || closedTime == null)
                      ? 'Senin 08:00 - 16:00'
                      : '$day $openTime - $closedTime',
                  style: TextStyle(
                    color: ColorCollection.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
