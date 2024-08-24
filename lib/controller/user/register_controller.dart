import 'package:bank_sampah/services/user/register_service.dart';
import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();
  final errorMessageName = Rxn<String>();
  final errorMessageNIK = Rxn<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();

  RxBool isLoadingRegister = false.obs;

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

  void validatorName(String value) {
    if (value.isEmpty) {
      errorMessageName.value = "Nama tidak boleh kosong";
    } else {
      errorMessageName.value = null;
    }
  }

  void validatorNIK(String value) {
    if (value.isEmpty) {
      errorMessageNIK.value = "NIK tidak boleh kosong";
    } else if (value.length != 16) {
      errorMessageNIK.value = "NIK harus 16 huruf";
    } else {
      errorMessageNIK.value = null;
    }
  }

  void register() async {
    validatorEmail(emailController.text);
    validatorPassword(passwordController.text);
    validatorName(nameController.text);
    validatorNIK(nikController.text);

    if (errorMessageEmail.value != null ||
        errorMessagePassword.value != null ||
        errorMessageName.value != null ||
        errorMessageNIK.value != null) {
      Get.snackbar(
        'Error',
        'Silahkan perbaiki kesalahan pada form',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoadingRegister.value = true;
      RegisterService()
          .registerWithEmailAndPassword(
        nameController.text,
        emailController.text,
        passwordController.text,
        nikController.text,
      )
          .then((value) {
        if (value == 'success') {
          clearText();
          Get.snackbar(
            'Berhasil',
            'Pendaftaran berhasil, silahkan login',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAll(() => LoginPage());
        } else if (value == 'weak-password') {
          Get.snackbar(
            'Kata sandi lemah',
            'Kata sandi harus lebih dari 5 huruf',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (value == 'email-already-in-use') {
          Get.snackbar(
            'Email sudah terdaftar',
            'Email sudah terdaftar, silahkan gunakan email lain',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        isLoadingRegister.value = false;
      });
    } catch (e) {
      isLoadingRegister.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan, silahkan coba lagi',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void clearText() {
    nameController.clear();
    emailController.clear();
    nikController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    nikController.dispose();
    super.dispose();
  }
}
