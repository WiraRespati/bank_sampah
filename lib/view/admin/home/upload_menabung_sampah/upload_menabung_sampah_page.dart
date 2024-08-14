import 'package:bank_sampah/controller/admin/menabung_sampah_controller.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/button_upload_widget.dart';
import 'package:bank_sampah/view/widget/search_widget.dart';
import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_sampah/controller/admin/search_user_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/upload_image_widget.dart';

class UploadMenabungSampahPage extends StatelessWidget {
  final SearchUserController searchController = Get.put(SearchUserController());
  final MenabungSampahController menabungSampahController = Get.put(
    MenabungSampahController(),
  );
  UploadMenabungSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchUserController searchUserController =
        Get.put(SearchUserController());
    searchUserController.getAllUser();
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const KelolaHeaderWidget(
                  title: 'Menabung Sampah',
                ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              titleForm: 'Nama Lengkap',
                              hintText: 'Nama Lengkap',
                              isEnabled: false,
                              isPassword: false,
                              controller: menabungSampahController
                                  .namaLengkapController,
                            ),
                            const SizedBox(height: 24),
                            TextFormFieldWidget(
                              titleForm: 'Deskripsi',
                              hintText: 'Deskripsikan Sampah yang dikumpul',
                              isPassword: false,
                              controller:
                                  menabungSampahController.deskripsiController,
                              errorText: menabungSampahController
                                  .errorMessageDeskripsi.value,
                              onChanged: (String value) {
                                menabungSampahController
                                    .validatorDeskripsi(value);
                              },
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(height: 24),
                            TextFormFieldWidget(
                              titleForm: 'Nilai Point',
                              hintText: 'Masukkan Nilai Point',
                              isPassword: false,
                              controller:
                                  menabungSampahController.nilaiPointController,
                              errorText: menabungSampahController
                                  .errorMessageNilaiPoint.value,
                              onChanged: (String value) {
                                menabungSampahController
                                    .validatorNilaiPoint(value);
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
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
                                        searchController.searchController.text =
                                            searchController
                                                .searchResults[index]
                                                .toString();
                                        menabungSampahController.nik.value =
                                            searchController
                                                .searchResults[index]
                                                .toString();
                                        menabungSampahController
                                                .namaLengkapController.text =
                                            searchController.getNamaUser(
                                                searchController
                                                    .searchResults[index]);
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
                UploadImageWidget(),
                const SizedBox(height: 128),
              ],
            ),
          ),
          const ButtonUploadWidget(),
        ],
      ),
    );
  }
}
