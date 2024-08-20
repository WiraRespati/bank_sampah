import 'package:bank_sampah/models/pengumpulan_sampah_model.dart';
import 'package:bank_sampah/services/user/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/konversi_model.dart';
import '../../services/user/riwayat_service.dart';

class RiwayatController extends GetxController {
  Rxn<List<KonversiModel>> listRiwayatKonversi = Rxn<List<KonversiModel>>([]);
  Rxn<List<PengumpulanSampah>> listRiwayatMenabung =
      Rxn<List<PengumpulanSampah>>([]);

  void getAllRiwayatKonversi() async {
    try {
      final response =
          await RiwayatService().getAllRiwayatKonversi(AuthService().user!.uid);
      if (response['status'] == 'success') {
        listRiwayatKonversi.value = response['riwayat'];
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
        'Gagal mengambil data riwayat (error: $e)',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  void getAllRiwayatMenabung() async {
    try {
      final response = await RiwayatService().getAllRiwayatMenabung();
      if (response['status'] == 'success') {
        listRiwayatMenabung.value = response['riwayat'];
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
        'Gagal mengambil data riwayat (error: $e)',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
