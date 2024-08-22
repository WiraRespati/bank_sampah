import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/widget/show_modal_buttom_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  const ItemHomeWidget({
    super.key,
    this.image,
    this.title,
    this.point,
    this.description,
    this.date,
    this.stok,
  });

  final String? image;
  final String? title;
  final String? point;
  final String? description;
  final String? date;
  final String? stok;

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
              stok: stok,
            );
          },
        );
      },
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
        // width: 132,
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image != null && image!.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image!,
                      placeholder: (context, url) => Image.asset(
                        'assets/images/logobs.png',
                        height: 132,
                        fit: BoxFit.cover,
                        width: 132,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/logobs.png',
                        height: 132,
                        width: 132,
                        fit: BoxFit.cover,
                      ),
                      height: 132,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logobs.png',
                      height: 132,
                      width: 132,
                      fit: BoxFit.cover,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 14, right: 8),
              child: Text(
                title ?? 'Beras 5Kg',
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
                  point ?? "harga",
                  style: TextStyleCollection.captionMedium.copyWith(
                    fontSize: 12,
                    color: const Color(0xFFF39E09),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
