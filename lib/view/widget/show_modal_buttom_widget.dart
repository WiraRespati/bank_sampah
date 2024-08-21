import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowModalButtomWidget extends StatelessWidget {
  const ShowModalButtomWidget(
      {super.key,
      this.title,
      this.description,
      this.image,
      this.date,
      this.point,
      this.stok});

  final String? title;
  final String? description;
  final String? image;
  final String? date;
  final String? point;
  final String? stok;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                    height: 100,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/logobs.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  height: 100,
                  width: 100,
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
                    Text(
                      Helper.capitalizeEachWord(title!),
                      style: TextStyleCollection.bodyBold.copyWith(
                        fontSize: 16,
                        color: ColorCollection.black,
                      ),
                      maxLines: 1,
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
                          style: TextStyleCollection.captionMedium.copyWith(
                            fontSize: 16,
                            color: const Color(0xFFF39E09),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    stok != null
                        ? Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: ColorPrimary.primary100,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "$stok Unit",
                                style:
                                    TextStyleCollection.captionMedium.copyWith(
                                  fontSize: 16,
                                  color: ColorCollection.black,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range_rounded,
                            color: ColorPrimary.primary100, size: 15),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          date ?? '07/08/2024 09:00',
                          style: TextStyleCollection.captionMedium.copyWith(
                            fontSize: 16,
                            color: ColorCollection.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description ?? 'Description',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyleCollection.captionMedium.copyWith(
              fontSize: 16,
              color: ColorCollection.black,
            ),
          ),
        ],
      ),
    );
  }
}
