import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadMenabungSampahHeaderWidget extends StatelessWidget {
  const UploadMenabungSampahHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorCollection.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000)
                .withOpacity(0.25), 
            offset: const Offset(10, 10), 
            blurRadius: 20, 
            spreadRadius: 0, 
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                Get.to(() => BottomNavbarAdmin());
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorPrimary.primary100,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        ],
      ),
    );
  }
}
