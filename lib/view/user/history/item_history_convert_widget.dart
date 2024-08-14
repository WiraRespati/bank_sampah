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
      margin: const EdgeInsets.symmetric( vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
        border: const Border(
          bottom: BorderSide(
            color: Color(0x801C9351),
            width: 1,
          ),
        ),
        borderRadius:   BorderRadius.circular(16),
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
                            'https://cdn.ralali.id/assets/img/Libraries/Beras-Premium-Cap-Tiga-Mangga-5kg_mtJX9ekyQrY1jWrn_1562573061.jpg',
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
                                style:
                                    TextStyleCollection.captionMedium.copyWith(
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
                        child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 16),
                          decoration: BoxDecoration(
                            color: ColorPrimary.primary100.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Tutup',
                              style: TextStyleCollection.captionMedium.copyWith(
                                fontSize: 14,
                                color: ColorPrimary.primary100,
                              ),
                            ),
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
