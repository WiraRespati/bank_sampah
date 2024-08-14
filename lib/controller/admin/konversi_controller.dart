import 'package:get/get.dart';
import 'package:flutter/material.dart';

class KonversiController extends GetxController {
  // TextEditingController untuk mengontrol input teks pencarian user dan barang
  final TextEditingController searchUserController = TextEditingController();
  final TextEditingController searchBarangController = TextEditingController();

  // Observable untuk menyimpan hasil pencarian user dan barang
  var searchUserResults = <String>[].obs;
  var searchBarangResults = <String>[].obs;

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
    if (query.isEmpty) {
      clearSearchUser();
      return;
    }

    isSearchingUser.value = true;
    searchUserResults.value = dummyUserData
        .where((user) => user.toLowerCase().contains(query.toLowerCase()))
        .toList();
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
    if (query.isEmpty) {
      clearSearchBarang();
      return;
    }

    isSearchingBarang.value = true;
    searchBarangResults.value = dummyBarangData
        .where((barang) => barang.toLowerCase().contains(query.toLowerCase()))
        .toList();
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
}