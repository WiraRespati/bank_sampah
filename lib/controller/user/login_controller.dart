import 'package:bank_sampah/services/user/login.dart';
import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoadingLogin = false.obs;

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
    try {
      isLoadingLogin.value = true;
      LoginService()
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) {
        if (value == 'success') {
          isLoadingLogin.value = false;
          Get.snackbar(
            'Berhasil',
            'Login berhasil',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAll(() => BottomNavbar());
        } else if (value == 'user-not-found') {
          isLoadingLogin.value = false;
          Get.snackbar(
            'Gagal',
            'Pengguna tidak ditemukan',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (value == 'wrong-password') {
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
            'Email atau kata sandi salah',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      });
      isLoadingLogin.value = false;
    } catch (e) {
      isLoadingLogin.value = false;
      Get.snackbar(
        'Gagal',
        'Something error occured',
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
