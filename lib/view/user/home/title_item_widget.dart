import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class TitleItemWidget extends StatelessWidget {
  const TitleItemWidget({super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    title,
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorPrimary.primary100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: IconButton(
                    color: ColorPrimary.primary100,
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.grid_view_rounded,
                    ),
                  ),
                ),
              ],
            );
  }
}