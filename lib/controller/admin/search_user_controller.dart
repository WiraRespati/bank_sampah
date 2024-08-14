import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../services/user/auth_service.dart';

class SearchUserController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var isSearching = false.obs;
  var searchResults = [].obs;

  Rxn<List<UserModel>> listUsers = Rxn<List<UserModel>>([]);

  void startSearch(String query) {
    if (query.isNotEmpty) {
      isSearching.value = true;
      final result = listUsers.value!
          .where((element) => element.nik!.contains(query))
          .map((e) => e.nik)
          .toList();
      searchResults.assignAll(result);
      
    } else {
      isSearching.value = false;
      searchResults.clear();
    }
  }

  void clearSearchText() {
    searchController.clear();
    searchResults.clear();
    isSearching.value = false;
  }

  void clearSearch() {
    searchResults.clear();
    isSearching.value = false;
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
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String getNamaUser(String nik) {
    final user = listUsers.value!.firstWhere((element) => element.nik == nik);
    return user.name!;
  }
}
