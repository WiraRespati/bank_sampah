import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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

  @override
  void dispose() {
    namaLengkapController.dispose();
    editPasswordController.dispose();
    nomorTeleponController.dispose();
    super.dispose();
  }
}
