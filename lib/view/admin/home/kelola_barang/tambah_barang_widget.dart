import 'package:bank_sampah/controller/admin/barang_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/tambah_barang_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TambahBarangWidget extends StatelessWidget {
  TambahBarangWidget({super.key, this.onTap});
  final Function()? onTap;

  final BarangController controller = Get.put(BarangController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.setTapped(true),
      onTapUp: (_) {
        controller.setTapped(false);
        if (onTap != null) {
          onTap!();
        }
      },
      onTapCancel: () => controller.setTapped(false),
      onTap: () {
        Get.to(() =>  const TambahBarangPage());
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 32),
          height: 65,
          decoration: BoxDecoration(
            color: controller.isTapped.value
                ? ColorPrimary.primary200
                : ColorPrimary.primary100,
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
              Container(
                width: 190,
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  'Tambah Barang Yang Bisa Di Tukar',
                  style: TextStyleCollection.captionMedium
                      .copyWith(fontSize: 16, color: ColorCollection.white),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/icon_add.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
