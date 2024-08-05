import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/login/login_back.dart';
import 'package:bank_sampah/view/user/login/login_banner.dart';
import 'package:bank_sampah/view/user/login/login_button.dart';
import 'package:bank_sampah/view/user/login/login_footer.dart';
import 'package:bank_sampah/view/user/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SingleChildScrollView(
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
    );
  }
}
