// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/utils/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              height: 250,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title ?? 'Detail Barang',
                        style: TextStyleCollection.bodyBold.copyWith(
                          fontSize: 16,
                          color: ColorPrimary.primary100,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: ColorPrimary.primary100,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: image ?? '',
                          placeholder: (context, url) => Image.asset(
                            'assets/images/logobs.png',
                            height: 150,
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/logobs.png',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  date ?? '07/08/2024 09:00',
                                  style: TextStyleCollection.captionMedium
                                      .copyWith(
                                    fontSize: 16,
                                    color: ColorPrimary.primary100,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                  point ?? '1.000',
                                  style: TextStyleCollection.captionMedium
                                      .copyWith(
                                    fontSize: 14,
                                    color: const Color(0xFFF39E09),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              description ?? 'Description',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleCollection.captionMedium.copyWith(
                                fontSize: 16,
                                color: ColorPrimary.primary100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                      '07/08/2024 09:00',
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
                          '50.000',
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
