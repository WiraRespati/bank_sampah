import 'package:bank_sampah/models/barang_model.dart';
import 'package:bank_sampah/services/admin/show_barang_services.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../services/admin/konversi_service.dart';
import '../../services/user/auth_service.dart';

class KonversiController extends GetxController {
  // TextEditingController untuk mengontrol input teks pencarian user dan barang
  final TextEditingController searchUserController = TextEditingController();
  final TextEditingController searchBarangController = TextEditingController();
  var isLoading = false.obs;

  // TextEditingController untuk user
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController pointsController = TextEditingController();

  //TextEditingController untuk barang
  final TextEditingController namaBarangController = TextEditingController();
  final TextEditingController hargaBarangController = TextEditingController();
  final TextEditingController stockBarangController = TextEditingController();

  Rxn<List<UserModel>> listUsers = Rxn<List<UserModel>>([]);
  Rxn<List<BarangModel>> listBarang = Rxn<List<BarangModel>>([]);
  Rxn<UserModel> selectedUser = Rxn<UserModel>();
  Rxn<BarangModel> selectedBarang = Rxn<BarangModel>();
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
    namaLengkapController.clear();
    pointsController.clear();
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
    namaBarangController.clear();
    stockBarangController.clear();
    hargaBarangController.clear();
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
    namaLengkapController.text = user.name!;
    pointsController.text = user.points.toString();
  }

  void getDataBarang(String namaBarang) {
    final barang =
        listBarang.value!.firstWhere((element) => element.name == namaBarang);
    selectedBarang.value = barang;
    namaBarangController.text = barang.name!;
    hargaBarangController.text = barang.price.toString();
    stockBarangController.text = barang.stock.toString();
  }

  void konversiBarang() async {
    final userModel = selectedUser.value!;
    final barangModel = selectedBarang.value!;
    if (userModel.points! < barangModel.price! || barangModel.stock! == 0) {
      Get.snackbar(
        'Error',
        'Point atau stock barang tidak cukup',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    await KonversiService()
        .konversiBarang(userModel, barangModel)
        .then((value) {
      isLoading.value = false;
      if (value['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Berhasil melakukan konversi barang',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        getAllBarang();
        getAllUser();
        Get.to(() => BottomNavbarAdmin());
      } else {
        Get.snackbar(
          'Error',
          'Gagal melakukan konversi barang (error: ${value['message']})',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }).catchError((error) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Gagal melakukan konversi barang (error: $error)',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  void clearForm() {
    searchUserController.clear();
    searchBarangController.clear();
    namaLengkapController.clear();
    pointsController.clear();
    namaBarangController.clear();
    hargaBarangController.clear();
    stockBarangController.clear();
  }

  void clearBarang() {
    namaBarangController.clear();
    hargaBarangController.clear();
    stockBarangController.clear();
  }

  @override
  void dispose() {
    searchUserController.dispose();
    searchBarangController.dispose();
    namaLengkapController.dispose();
    pointsController.dispose();
    namaBarangController.dispose();
    hargaBarangController.dispose();
    stockBarangController.dispose();
    super.dispose();
  }
}
