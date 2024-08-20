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

  void filterRiwayatKonversi() async {
    if (selectedPeriod.value == '1 hari') {
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 1));
      final response = await ShowRiwayatKonversiService()
          .getFilteredRiwayatKonversi(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
        listUser.value = response['users'];
        print(listRiwayat.value);
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat menabung',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } else if (selectedPeriod.value == '1 minggu') {
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 7));
      final response = await ShowRiwayatKonversiService()
          .getFilteredRiwayatKonversi(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
        listUser.value = response['users'];
        print(listRiwayat.value);
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat menabung',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } else if (selectedPeriod.value == '1 bulan') {
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 30));
      final response = await ShowRiwayatKonversiService()
          .getFilteredRiwayatKonversi(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
        listUser.value = response['users'];
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat menabung',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } else if (selectedPeriod.value == '1 tahun') {
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 365));
      final response = await ShowRiwayatKonversiService()
          .getFilteredRiwayatKonversi(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
        listUser.value = response['users'];
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat menabung',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    }
  }
}
