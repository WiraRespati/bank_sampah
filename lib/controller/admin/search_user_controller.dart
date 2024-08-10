import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUserController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var isSearching = false.obs;
  var searchResults = <String>[].obs;

  void startSearch(String query) {
    if (query.isNotEmpty) {
      isSearching.value = true;
      searchResults.value =
          List.generate(100000, (index) => 'Result $index for "$query"');
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
}
