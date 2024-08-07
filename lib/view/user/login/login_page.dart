import 'package:bank_sampah/controller/user/login_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_back.dart';
import 'package:bank_sampah/view/user/login/login_banner.dart';
import 'package:bank_sampah/view/user/login/login_button.dart';
import 'package:bank_sampah/view/user/login/login_footer.dart';
import 'package:bank_sampah/view/user/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  
  final LoginController loginController = Get.put(
    LoginController(),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginBack(),
                      const LoginBanner(),
                      LoginForm(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginButton(),
                      const LoginFooter(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              if (loginController.isLoadingLogin.value) {
                return Container(
                  color: ColorNeutral.neutral50.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary100,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
