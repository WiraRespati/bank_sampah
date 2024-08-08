import 'package:bank_sampah/controller/user/edit_profile_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:bank_sampah/view/user/profile/edit_profile/edit_profile_form_widget.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final ProfileController editController = Get.put(
    ProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        title: Text(
          'Edit Profil',
          style: TextStyleCollection.subtitleBold.copyWith(fontSize: 18),
        ),
        toolbarHeight: 56,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorPrimary.primary100),
          onPressed: () {
            FocusScope.of(context).unfocus();
            // editController.cancelEditProfile();
            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                Get.back();
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              EditProfileFormWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ButtonWidget(
                onPressed: () async {
                  Get.to(BottomNavbar());
                },
                text: 'Edit Profil',
                textColor: ColorNeutral.neutral100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
