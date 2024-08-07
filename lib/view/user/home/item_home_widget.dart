import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  const ItemHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 15, bottom: 10,),
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFA6A6A6), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 18,
            spreadRadius: 0,
          ),
        ],
      ),
      width: 132,
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logobanksampah.jpg',
            height: 132,
            width: 132,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 9,
              left: 14,
            ),
            child: Text(
              'Beras 5Kg',
              style: TextStyleCollection.caption.copyWith(
                fontSize: 14,
                color: ColorCollection.black,
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/koin.png',
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "45.000",
                style: TextStyleCollection.captionMedium.copyWith(
                  fontSize: 12,
                  color: const Color(0xFFF39E09),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
