import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerProfileWidget extends StatelessWidget {
  const BannerProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Image.asset(
                      'assets/images/logobs.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 37,
                      width: 174,
                      child: SvgPicture.asset(
                        'assets/images/title_bank_sampah.svg',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPrimary.primary100.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        color: ColorPrimary.primary100,
                      ),
                    ),
                  ),
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
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      border: Border.all(
                        color: const Color(0xFFB6E0B1),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 21,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/logobs.png',
                              height: 42,
                              width: 42,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 18),
                          child: Column(
                            children: [
                              Text(
                                'Nama Lengkap',
                                style: TextStyleCollection.bodyMedium.copyWith(
                                    fontSize: 16,
                                    color: ColorPrimary.primary100),
                              ),
                              const Text(
                                '3576447103910003',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4F4F4F),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
