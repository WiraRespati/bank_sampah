import 'package:bank_sampah/models/pengumpulan_sampah_model.dart';
import 'package:bank_sampah/services/admin/riwayat_menabung_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatMenabungController extends GetxController {
  var selectedPeriod = '1 hari'.obs;

  Rxn<List<PengumpulanSampah>> listRiwayat = Rxn<List<PengumpulanSampah>>([]);

  void updatePeriod(String period) {
    selectedPeriod.value = period;
  }

  void getAllRiwayat() async {
    try {
      final response = await RiwayatMenabungService().getAllRiwayatMenabung();
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data riwayat menabung',
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

  void filterRiwayatMenabung() async {
    if (selectedPeriod.value == '1 hari') {
      // filter 1 hari
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 1));
      final response =
          await RiwayatMenabungService().getFilteredRiwayatMenabung(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
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
      // filter 1 minggu
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 7));
      final response =
          await RiwayatMenabungService().getFilteredRiwayatMenabung(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
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
      // filter 1 bulan
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 30));
      final response =
          await RiwayatMenabungService().getFilteredRiwayatMenabung(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
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
      // filter 1 tahun
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(const Duration(days: 365));
      final response =
          await RiwayatMenabungService().getFilteredRiwayatMenabung(oneWeekAgo);
      if (response['status'] == 'success') {
        listRiwayat.value = response['riwayat'];
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
