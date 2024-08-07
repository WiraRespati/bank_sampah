import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/widgets.dart';

class BannerHomeWidget extends StatelessWidget {
  const BannerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/banner_home.png',
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorCollection.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Image.asset(
                      'assets/images/logobanksampah.jpg',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/banksampah_title.jpg',
                      height: 37,
                      width: 174,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 2,
                    ),
                    height: 110,
                    width: 320,
                    decoration: BoxDecoration(
                      color: ColorNeutral.neutral50,
                      border: Border.all(
                        color: const Color(0xFFB6E0B1),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB6E0B1).withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(
                        "Halo Wira Selamat Datang",
                        style: TextStyleCollection.captionMedium.copyWith(
                          fontSize: 16,
                          color: ColorPrimary.primary100,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    child: Container(
                        height: 55,
                        width: 320,
                        decoration: BoxDecoration(
                          color: ColorNeutral.neutral50,
                          border: Border.all(
                            color: const Color(0xFFB6E0B1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                              ),
                              child: Text(
                                "Total Koin Anda",
                                style:
                                    TextStyleCollection.captionMedium.copyWith(
                                  fontSize: 16,
                                  color: ColorCollection.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 18,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/koin.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '45.000',
                                    style: TextStyleCollection.captionMedium
                                        .copyWith(
                                      fontSize: 16,
                                      color: ColorCollection.black,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
