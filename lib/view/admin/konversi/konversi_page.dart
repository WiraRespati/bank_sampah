import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/banner_home_admin_widget.dart';
import 'package:bank_sampah/view/admin/konversi/form_barang_widget.dart';
import 'package:bank_sampah/view/admin/konversi/form_user_widget.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:bank_sampah/view/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_sampah/controller/admin/konversi_controller.dart';

class KonversiPage extends StatelessWidget {
  KonversiPage({super.key});

  final KonversiController konversiController = Get.put(KonversiController());

  @override
  Widget build(BuildContext context) {
    konversiController.getAllUser();
    konversiController.getAllBarang();
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const BannerHomeAdminWidget(),
                const SizedBox(height: 24),
                Obx(() {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SearchWidget(
                            controller: konversiController.searchUserController,
                            onChanged: (query) =>
                                konversiController.startSearchUser(query),
                            onClear: konversiController.clearSearchUserText,
                            hintText: "Cari NIK",
                          ),
                          const FormUserWidget(),
                        ],
                      ),
                      if (konversiController.isSearchingUser.value)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              margin: const EdgeInsets.only(top: 80),
                              height: 200,
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
                                  itemCount: konversiController
                                      .searchUserResults.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(konversiController
                                          .searchUserResults[index]),
                                      onTap: () {
                                        konversiController
                                                .searchUserController.text =
                                            konversiController
                                                .searchUserResults[index]
                                                .toString();
                                        konversiController.getDataUser(
                                            konversiController
                                                .searchUserResults[index]);
                                        konversiController.clearSearchUser();
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
                Obx(() {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SearchWidget(
                            hintText: "Cari Nama Barang",
                            keyboardType: TextInputType.text,
                            icon: const Icon(Icons.search),
                            controller:
                                konversiController.searchBarangController,
                            onChanged: (query) =>
                                konversiController.startSearchBarang(query),
                            onClear: konversiController.clearSearchBarangText,
                          ),
                          const FormBarangWidget(),
                        ],
                      ),
                      if (konversiController.isSearchingBarang.value)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              margin: const EdgeInsets.only(top: 80),
                              height: 200,
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
                                  itemCount: konversiController
                                      .searchBarangResults.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(konversiController
                                          .searchBarangResults[index]),
                                      onTap: () {
                                        konversiController
                                                .searchBarangController.text =
                                            konversiController
                                                .searchBarangResults[index];
                                        konversiController.getDataBarang(
                                            konversiController
                                                .searchBarangResults[index]);
                                        konversiController.clearSearchBarang();
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ButtonWidget(
                      onPressed: () {
                        konversiController.konversiBarang();
                      },
                      text: 'Konversi',
                      textColor: ColorNeutral.neutral100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () {
              if (konversiController.isLoading.value) {
                return Container(
                  color: ColorNeutral.neutral50.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary100,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
