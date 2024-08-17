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
          'Gagal mengambil data riwayat',
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
}
