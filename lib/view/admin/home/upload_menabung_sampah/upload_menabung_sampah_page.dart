import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:bank_sampah/view/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_sampah/controller/admin/search_user_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/upload_menabung_sampah_header_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/input_form_menabung_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/upload_image_widget.dart';

class UploadMenabungSampahPage extends StatelessWidget {
  final SearchUserController searchController = Get.put(SearchUserController());

  UploadMenabungSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const UploadMenabungSampahHeaderWidget(),
                const SizedBox(height: 32),
                SearchWidget(
                  controller: searchController.searchController,
                  onChanged: (query) => searchController.startSearch(query),
                  onClear: searchController.clearSearchText,
                ),
                const SizedBox(height: 24),
                Obx(() {
                  return Stack(
                    children: [
                      const InputFormMenabungWidget(),
                      if (searchController.isSearching.value)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 300,
                              decoration: BoxDecoration(
                                color: ColorCollection.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.25),
                                    offset: const Offset(10, 10),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      searchController.searchResults.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(searchController
                                          .searchResults[index]),
                                      onTap: () {
                                        searchController.clearSearch();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
                const SizedBox(height: 24),
                const UploadImageWidget(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ButtonWidget(
                      onPressed: () async {},
                      text: 'Upload Menabung Sampah',
                      textColor: ColorNeutral.neutral100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
