import 'package:bank_sampah/view/admin/login/login_admin_back_widget.dart';
import 'package:bank_sampah/view/admin/login/login_banner_admin_widget.dart';
import 'package:bank_sampah/view/admin/login/login_button_admin_widget.dart';
import 'package:bank_sampah/view/admin/login/login_footer_admin_widget.dart';
import 'package:bank_sampah/view/admin/login/login_form_admin_widget.dart';
import 'package:flutter/material.dart';

class LoginAdminPage extends StatelessWidget {
  const LoginAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const LoginAdminBackWidget(),
                  const LoginBannerAdminWidget(),
                  LoginFormAdminWidget(),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginButtonAdminWidget(),
                  LoginFooterAdminWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
