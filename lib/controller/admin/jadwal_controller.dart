import 'package:bank_sampah/models/jadwal_model.dart';
import 'package:bank_sampah/services/admin/add_jadwal_service.dart';
import 'package:bank_sampah/services/admin/show_jadwal_service.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/kelola_jadwal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class JadwalController extends GetxController {
  var isTapped = false.obs;
  var selectedDay = 'Senin'.obs;
  RxString openTime = ''.obs;
  RxString closeTime = ''.obs;
  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];

  var openTimePickerController = TimePickerSpinnerController();
  var closedTimePickerController = TimePickerSpinnerController();

  RxBool isLoadingAddJadwal = false.obs;
  RxBool isLoadingJadwalData = false.obs;
  RxList<JadwalModel> jadwalList = <JadwalModel>[].obs;

  void setTapped(bool tapped) {
    isTapped.value = tapped;
  }

  void setOpenTime(String time) {
    openTime.value = time;
    debugPrint("Open time set to: $time");
  }

  void setCloseTime(String time) {
    closeTime.value = time;
    debugPrint("Close time set to: $time");
  }

  Future<void> addJadwal() async {
    isLoadingAddJadwal.value = true;
    if (selectedDay.value.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Harap pilih hari',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (openTime.value.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Harap pilih waktu buka',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (closeTime.value.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Harap pilih waktu tutup',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    try {
      await AddJadwalService().addJadwal(
        selectedDay.value,
        openTime.value,
        closeTime.value,
      );
      Get.snackbar(
        'Success',
        'Jadwal berhasil ditambahkan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearData();
      fetchJadwalData();

      Get.off(() =>  KelolaJadwalPage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan jadwal',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingAddJadwal.value = false;
    }
  }

  Future<void> fetchJadwalData() async {
    isLoadingJadwalData.value = true;
    try {
      final result = await ShowJadwalServices().getAllJadwalData();
      if (result['status'] == 'success') {
        jadwalList.value = result['jadwal'];
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data jadwal: Status tidak sukses',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengambil data jadwal: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingJadwalData.value = false;
    }
  }

  Future<void> deleteJadwal(String id) async {
    try {
      await ShowJadwalServices().deleteJadwal(id);
      Get.snackbar(
        'Success',
        'Jadwal berhasil dihapus',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      fetchJadwalData();
      Get.offAll(() =>  KelolaJadwalPage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menghapus jadwal',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearData() {
    selectedDay.value = 'Senin';
    openTime.value = '';
    closeTime.value = '';
  }

  @override
  void dispose() {
    openTimePickerController.dispose();
    closedTimePickerController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    fetchJadwalData();
    super.onInit();
  }
}
