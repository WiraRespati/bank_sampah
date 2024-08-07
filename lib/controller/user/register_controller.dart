import 'package:bank_sampah/view/user/login/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    try {
      isLoadingRegister.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'name': nameController.text,
        'email': emailController.text,
        'nik': nikController.text,
        'role': 'user',
      });
      isLoadingRegister.value = false;
      nameController.clear();
      emailController.clear();
      nikController.clear();
      passwordController.clear();
      Get.snackbar(
        'Berhasil',
        'Pendaftaran berhasil, silahkan login',
        snackPosition: SnackPosition.TOP,
      );
      Get.offAll(() =>  LoginPage());
    } on FirebaseAuthException catch (e) {
      isLoadingRegister.value = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Kata sandi lemah',
          'Kata sandi harus lebih dari 6 huruf',
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email sudah terdaftar',
          'Email sudah terdaftar, silahkan gunakan email lain',
          snackPosition: SnackPosition.TOP,
        );
      }
    }
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
