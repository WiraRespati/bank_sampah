import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemAdminWidget extends StatelessWidget {
  const ItemAdminWidget({
    super.key,
    this.onPressed,
    required this.buttonName,
    this.image,
    this.title,
    this.point,
    this.onTapItem,
  });

  final Function()? onPressed;
  final Function()? onTapItem;
  final String buttonName;
  final String? image;
  final String? title;
  final String? point;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image != null && image!.isNotEmpty
                ? Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image!,
                        placeholder: (context, url) => Image.asset(
                          'assets/images/logobs.png',
                          height: 152,
                          fit: BoxFit.cover,
                          width: 152,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/logobs.png',
                          height: 152,
                          width: 152,
                          fit: BoxFit.cover,
                        ),
                        height: 152,
                        width: 152,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logobs.png',
                      height: 152,
                      width: 152,
                      fit: BoxFit.cover,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                top: 9,
                left: 14,
              ),
              child: Text(
                title ?? 'Nama Barang',
                maxLines: 1,
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
                  point ?? "Points",
                  style: TextStyleCollection.captionMedium.copyWith(
                    fontSize: 12,
                    color: const Color(0xFFF39E09),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 29,
                child: ButtonWidget(
                  onPressed: onPressed,
                  text: buttonName,
                  textColor: ColorNeutral.neutral100,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
