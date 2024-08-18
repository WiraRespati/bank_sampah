import 'package:bank_sampah/controller/user/profile_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/maps/maps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BannerProfileWidget extends StatelessWidget {
  BannerProfileWidget({super.key});
  final ProfileController profileController = Get.put(ProfileController());
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
                      onPressed: () {
                        Get.to(() => const MapsPage());
                      },
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
                          padding: const EdgeInsets.only(left: 21),
                          child: Obx(() {
                            final user = profileController.userData.value;
                            Icon genderIcon;
                            if (user?.gender == 'Pria') {
                              genderIcon = Icon(Icons.male,
                                  size: 32, color: ColorPrimary.primary100);
                            } else if (user?.gender == 'Wanita') {
                              genderIcon = Icon(Icons.female,
                                  size: 32, color: ColorPrimary.primary100);
                            } else {
                              genderIcon = Icon(Icons.person,
                                  size: 32, color: ColorPrimary.primary100);
                            }
                            return ClipOval(child: genderIcon);
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 18),
                          child: Obx(() {
                            final user = profileController.userData.value;
                            return Column(children: [
                              profileController.isLoadingEditUser.value
                                  ? Shimmer.fromColors(
                                      baseColor: ColorNeutral.neutral50,
                                      highlightColor: ColorNeutral.neutral300,
                                      child: ClipOval(
                                        child: Container(
                                          width: 100.0,
                                          height: 16.0,
                                          color: ColorNeutral.neutral300,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          Text(
                                            user != null
                                                ? "${user.name}"
                                                : "Loading...",
                                            style: TextStyleCollection
                                                .bodyMedium
                                                .copyWith(
                                              fontSize: 16,
                                              color: ColorPrimary.primary100,
                                            ),
                                          ),
                                          Text(
                                            user?.nik ?? "Loading...",
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF4F4F4F),
                                            ),
                                          ),
                                        ])
                            ]);
                          }),
                        ),
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
