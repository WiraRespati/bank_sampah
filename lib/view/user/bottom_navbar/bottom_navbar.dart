import 'package:bank_sampah/controller/user/bottom_navbar_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/history/history_page.dart';
import 'package:bank_sampah/view/user/home/home_page.dart';
import 'package:bank_sampah/view/user/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  final BottomNavbarController controller = Get.put(BottomNavbarController());

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
                    icon: const Icon(Icons.home_filled),
                    title: Text(
                      "Beranda",
                      style: TextStyleCollection.captionBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: ColorPrimary.primary100,
                    unselectedColor: ColorNeutral.neutral700),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.history),
                    title: Text(
                      "Riwayat",
                      style: TextStyleCollection.captionBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: ColorPrimary.primary100,
                    unselectedColor: ColorNeutral.neutral700),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.person),
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
        return const Center(child: HomePage());
      case 1:
        return const Center(child: HistoryPage());
      case 2:
        return const Center(child: ProfilePage());
      default:
        return const Center(child: HomePage());
    }
  }
}
