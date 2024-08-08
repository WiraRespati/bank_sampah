// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/text_style_constant.dart';

class ItemHistoryConvertWidget extends StatelessWidget {
  const ItemHistoryConvertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
        border: const Border(
          bottom: BorderSide(
            color: Color(0x801C9351),
            width: 1,
          ),
        ),
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
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            color: ColorPrimary.primary100,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.black.withOpacity(0.7),
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Detail Tukar Koin',
                      textAlign: TextAlign.center,
                      style: TextStyleCollection.bodyBold.copyWith(
                        fontSize: 16,
                        color: ColorPrimary.primary100,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/8/3/41c4839f-1fd5-4bad-9566-5ecb4916b565.jpg',
                            fit: BoxFit.contain,
                            height: 250,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                '07/08/2024 09:00',
                                style: TextStyleCollection.captionMedium.copyWith(
                                  fontSize: 16,
                                  color: ColorPrimary.primary100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              'Beras Mangga 10Kg Beras Mangga 10Kg BerasMangga10KgBerasMangga10KgBerasMangga 10 Kg',
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleCollection.captionMedium.copyWith(
                                fontSize: 16,
                                color: ColorPrimary.primary100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      Center(
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: ColorPrimary.primary100,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
