import 'package:bank_sampah/models/user_model.dart';
import 'package:bank_sampah/services/admin/show_riwayat_konversi_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/konversi_model.dart';

class RiwayatKonversiController extends GetxController {
  var selectedPeriod = '1 hari'.obs;

  Rxn<List<KonversiModel>> listRiwayat = Rxn<List<KonversiModel>>([]);
  Rxn<List<UserModel>> listUser = Rxn<List<UserModel>>([]);

  void updatePeriod(String period) {
    selectedPeriod.value = period;
  }

  void getAllRiwayatKonversi() async {
    try {
      final response =
          await ShowRiwayatKonversiService().getAllRiwayatKonversi();
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
        listUser.value = response['users'];
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat konversi (error: ${response['message']})',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengambil data user (error: $e)',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  void filterRiwayatKonversi() {
    if (selectedPeriod.value == '1 hari') {
      // getAllRiwayatKonversi();
    } else if (selectedPeriod.value == '1 minggu') {
      // filter 1 minggu
    } else if (selectedPeriod.value == '1 bulan') {
      // filter 1 bulan
    } else if (selectedPeriod.value == '1 tahun') {
      // filter 1 tahun
    }
  }
}
