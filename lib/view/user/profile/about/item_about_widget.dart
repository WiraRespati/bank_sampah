import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/cupertino.dart';

class ItemAboutWidget extends StatelessWidget {
  const ItemAboutWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorCollection.white,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF1C9351)
                .withOpacity(0.5),
            width: 1, 
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1C9351).withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      height: 226,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 34, top: 14, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyleCollection.captionBold.copyWith(
                    fontSize: 24,
                    color: ColorPrimary.primary100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              description,
              style: TextStyleCollection.caption.copyWith(
                fontSize: 10,
                color: ColorPrimary.primary100,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
