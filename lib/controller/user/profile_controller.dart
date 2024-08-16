import 'package:bank_sampah/view/user/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../services/user/auth_service.dart';
import '../../view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';

class ProfileController extends GetxController {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();

  final errorMessageNamaLengkap = Rxn<String>();
  final errorMessageEditPassword = Rxn<String>();
  final errorMessageNomorTelepon = Rxn<String>();

  RxString jenisKelamin = 'Pria'.obs;
  RxInt selectedGender = 1.obs;

  RxBool isLoadingUser = false.obs;
  RxBool isLoadingEditUser = false.obs;

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
      isLoadingUser.value = true;
      final UserModel response = await AuthService().getUserData();
      userData.value = response;
      namaLengkapController.text = response.name!;
      nomorTeleponController.text = response.phone!;
      jenisKelamin.value = response.gender!;
      selectedGender.value = jenisKelamin.value == 'Pria' ? 1 : 2;
      isLoadingUser.value = false;
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
    getUserData();
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
      isLoadingEditUser.value = true;
      await AuthService().updateUserData(user, editPasswordController.text);
      isLoadingEditUser.value = false;

      Get.snackbar(
        'Berhasil',
        'Profil berhasil diperbarui',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      if (await AuthService().checkAdmin()) {
        Get.offAll(() => BottomNavbarAdmin());
      } else {
        Get.offAll(() => BottomNavbar());
      }
    } catch (e) {
      isLoadingEditUser.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengupdate data',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
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
