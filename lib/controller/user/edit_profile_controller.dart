import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../services/user/auth_service.dart';

class ProfileController extends GetxController {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();

  final errorMessageNamaLengkap = Rxn<String>();
  final errorMessageEditPassword = Rxn<String>();
  final errorMessageNomorTelepon = Rxn<String>();

  RxString jenisKelamin = 'Pria'.obs;
  RxInt selectedGender = 1.obs;

  void selectGender(int value) {
    selectedGender.value = value;
    jenisKelamin.value = value == 1
        ? 'Pria'
        : value == 2
            ? 'Wanita'
            : '';
  }

  void validatorNamaLengkap(String value) {
    if (value.isEmpty) {
      errorMessageNamaLengkap.value = "Nama Lengkap tidak boleh kosong";
    } else {
      errorMessageNamaLengkap.value = null;
    }
  }

  void validatorNomorTelepon(String value) {
    if (value.isEmpty) {
      errorMessageNomorTelepon.value = "Nomor Telepon tidak boleh kosong";
    } else {
      errorMessageNomorTelepon.value = null;
    }
  }

  void validatorEditPassword(String value) {
    if (value.isEmpty) {
      errorMessageEditPassword.value = "Password tidak boleh kosong";
    } else if (value.length < 6) {
      errorMessageEditPassword.value = "Kata sandi harus lebih dari 6 huruf";
    } else {
      errorMessageEditPassword.value = null;
    }
  }

  Rxn<UserModel> userData = Rxn<UserModel>();

  void getUserData() async {
    try {
      final UserModel response = await AuthService().getUserData();
      userData.value = response;
      namaLengkapController.text = response.name!;
      nomorTeleponController.text = response.phone!;
      jenisKelamin.value = response.gender!;
      selectedGender.value = jenisKelamin.value == 'Pria' ? 1 : 2;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengambil data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//update user data
  Future<void> updateUserData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final UserModel user = UserModel(
      uid: userData.value!.uid,
      nik: userData.value!.nik,
      email: userData.value!.email,
      gender: jenisKelamin.value,
      name: namaLengkapController.text,
      phone: nomorTeleponController.text,
      points: userData.value!.points,
      role: userData.value!.role,
    );
    try {
      await firestore
          .collection('users')
          .doc(userData.value!.uid)
          .update(user.toJson());
      await auth.currentUser!.updateDisplayName(namaLengkapController.text);
      if (editPasswordController.text.isNotEmpty &&
          editPasswordController.text.length >= 6) {
        await auth.currentUser!.updatePassword(editPasswordController.text);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengupdate data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    editPasswordController.dispose();
    nomorTeleponController.dispose();
    super.dispose();
  }
}
