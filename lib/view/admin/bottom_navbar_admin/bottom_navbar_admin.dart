// ignore_for_file: deprecated_member_use
import 'package:bank_sampah/controller/admin/bottom_navbar_admin_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/admin/home/home_admin_page.dart';
import 'package:bank_sampah/view/user/history/history_page.dart';
import 'package:bank_sampah/view/user/home/home_page.dart';
import 'package:bank_sampah/view/user/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbarAdmin extends StatelessWidget {
  BottomNavbarAdmin({super.key});

  final BottomNavbarAdminController controller = Get.put(BottomNavbarAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: _getSelectedWidget(controller.currentIndex.value),
          )),
      bottomNavigationBar: Obx(() => Container(
            height: 84,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: ColorNeutral.neutral50,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SalomonBottomBar(
              backgroundColor: ColorNeutral.neutral50,
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.changeIndex(index);
              },
              items: [
                SalomonBottomBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/logo_home.svg",
                      height: 24,
                      width: 24,
                      color: controller.currentIndex.value == 0
                          ? ColorPrimary.primary100
                          : ColorNeutral.neutral700,
                    ),
                    title: Text(
                      "Beranda",
                      style: TextStyleCollection.captionBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: ColorPrimary.primary100,
                    unselectedColor: ColorNeutral.neutral700),
                SalomonBottomBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/logo_history.svg",
                      height: 24,
                      width: 24,
                      color: controller.currentIndex.value == 1
                          ? ColorPrimary.primary100
                          : ColorNeutral.neutral700,
                    ),
                    title: Text(
                      "Konversi",
                      style: TextStyleCollection.captionBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: ColorPrimary.primary100,
                    unselectedColor: ColorNeutral.neutral700),
                SalomonBottomBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/logo_profile.svg",
                      height: 24,
                      width: 24,
                      color: controller.currentIndex.value == 2
                          ? ColorPrimary.primary100
                          : ColorNeutral.neutral700,
                    ),
                    title: Text(
                      "Profil",
                      style: TextStyleCollection.captionBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: ColorPrimary.primary100,
                    unselectedColor: ColorNeutral.neutral700),
              ],
            ),
          )),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const Center(child: HomeAdminPage());
      case 1:
        return const Center(child: HistoryPage());
      case 2:
        return const Center(child: ProfilePage());
      default:
        return const Center(child: HomePage());
    }
  }
}
