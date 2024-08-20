import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:bank_sampah/services/user/login_service.dart';
import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';

class LoginController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoadingLogin = false.obs;
  RxBool isAdmin = false.obs;

  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  void validatorEmail(String value) {
    if (value.isEmpty) {
      errorMessageEmail.value = "Email tidak boleh kosong";
    } else if (!emailRegExp.hasMatch(value)) {
      errorMessageEmail.value = "Format email tidak valid";
    } else {
      errorMessageEmail.value = null;
    }
  }

  void validatorPassword(String value) {
    if (value.isEmpty) {
      errorMessagePassword.value = "Kata sandi tidak boleh kosong";
    } else if (value.length < 6) {
      errorMessagePassword.value = "Kata sandi harus lebih dari 6 huruf";
    } else {
      errorMessagePassword.value = null;
    }
  }

  void login() async {
    validatorEmail(emailController.text);
    validatorPassword(passwordController.text);

    if (errorMessageEmail.value != null || errorMessagePassword.value != null) {
      Get.snackbar(
        'Error',
        'Silahkan perbaiki kesalahan pada form',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoadingLogin.value = true;
    String result = await LoginService().signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    isLoadingLogin.value = false;
    if (result == 'success') {
      isAdmin.value = await AuthService().checkAdmin();
      isLoadingLogin.value = false;
      Get.snackbar(
        'Berhasil',
        'Login berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      if (isAdmin.value) {
        Get.offAll(() => BottomNavbarAdmin());
      } else {
        Get.offAll(() => BottomNavbar());
      }
      emailController.clear();
      passwordController.clear();
    } else if (result == 'user-not-found') {
      isLoadingLogin.value = false;
      Get.snackbar(
        'Gagal',
        'Pengguna tidak ditemukan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (result == 'wrong-password') {
      isLoadingLogin.value = false;
      Get.snackbar(
        'Gagal',
        'Kata sandi salah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      isLoadingLogin.value = false;
      Get.snackbar(
        'Gagal',
        'anda sudah memasukkan password yang salah terlalu banyak. Coba lagi nanti',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
