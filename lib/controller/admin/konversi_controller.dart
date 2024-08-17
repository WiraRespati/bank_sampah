import 'package:bank_sampah/models/barang_model.dart';
import 'package:bank_sampah/services/admin/show_barang_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../services/user/auth_service.dart';

class KonversiController extends GetxController {
  // TextEditingController untuk mengontrol input teks pencarian user dan barang
  final TextEditingController searchUserController = TextEditingController();
  final TextEditingController searchBarangController = TextEditingController();

  Rxn<List<UserModel>> listUsers = Rxn<List<UserModel>>([]);
  Rxn<List<BarangModel>> listBarang = Rxn<List<BarangModel>>([]);
  Rxn<UserModel> selectedUser = Rxn<UserModel>();
  // Observable untuk menyimpan hasil pencarian user dan barang
  var searchUserResults = [].obs;
  var searchBarangResults = [].obs;

  // Observable untuk mengontrol status pencarian user dan barang
  var isSearchingUser = false.obs;
  var isSearchingBarang = false.obs;

  // Dummy data untuk hasil pencarian user dan barang
  final List<String> dummyUserData = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
  ];

  final List<String> dummyBarangData = [
    'Barang 1',
    'Barang 2',
    'Barang 3',
    'Barang 4',
    'Barang 5',
  ];

  // Fungsi untuk memulai pencarian user
  void startSearchUser(String query) {
    if (query.isNotEmpty) {
      isSearchingUser.value = true;
      final result = listUsers.value!
          .where((element) => element.nik!.contains(query))
          .map((e) => e.nik)
          .toList();
      searchUserResults.assignAll(result);
    } else {
      isSearchingUser.value = false;
      searchUserResults.clear();
    }
  }

  // Fungsi untuk menghapus teks pencarian user
  void clearSearchUserText() {
    searchUserController.clear();
    clearSearchUser();
  }

  // Fungsi untuk menghapus hasil pencarian user
  void clearSearchUser() {
    isSearchingUser.value = false;
    searchUserResults.clear();
  }

  // Fungsi untuk memulai pencarian barang
  void startSearchBarang(String query) {
    if (query.isNotEmpty) {
      isSearchingBarang.value = true;
      final result = listBarang.value!
          .where((element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()))
          .map((e) => e.name)
          .toList();
      searchBarangResults.assignAll(result);
    } else {
      isSearchingBarang.value = false;
      searchBarangResults.clear();
    }
  }

  // Fungsi untuk menghapus teks pencarian barang
  void clearSearchBarangText() {
    searchBarangController.clear();
    clearSearchBarang();
  }

  // Fungsi untuk menghapus hasil pencarian barang
  void clearSearchBarang() {
    isSearchingBarang.value = false;
    searchBarangResults.clear();
  }

  void getAllUser() async {
    try {
      final response = await AuthService().getAllUserData();
      listUsers.value = response.values
          .map((doc) => UserModel.fromJson(doc as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengambil data user (error: $e)',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getAllBarang() async {
    try {
      final response = await ShowBarangServices().getAllBarangData();
      listBarang.value = response['barang'];
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengambil data barang (error: $e)',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void getDataUser(String nik) {
    final user = listUsers.value!.firstWhere((element) => element.nik == nik);
    selectedUser.value = user;
  }
}
