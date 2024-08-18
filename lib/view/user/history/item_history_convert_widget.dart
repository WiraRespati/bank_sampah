// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/widget/show_modal_buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/text_style_constant.dart';

class ItemHistoryConvertWidget extends StatelessWidget {
  const ItemHistoryConvertWidget(
      {super.key,
      this.title,
      this.description,
      this.image,
      this.date,
      this.point});

  final String? title;
  final String? description;
  final String? image;
  final String? date;
  final String? point;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return ShowModalButtomWidget(
              title: title,
              description: description,
              image: image,
              date: date,
              point: point,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/logo_history.svg",
                  height: 24,
                  width: 24,
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
                      date ?? '17/08/2024 09:00',
                      style: TextStyleCollection.captionMedium.copyWith(
                        fontSize: 16,
                        color: ColorPrimary.primary100,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/koin.png',
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          Helper.formatNumber(point!),
                          style: TextStyleCollection.captionMedium.copyWith(
                            fontSize: 14,
                            color: const Color(0xFFF39E09),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Icon(
              Icons.remove_red_eye_outlined,
              color: ColorPrimary.primary100,
            ),
          ],
        ),
      ),
    );
  }
}
