import 'package:bank_sampah/controller/admin/search_user_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/banner_home_admin_widget.dart';
import 'package:bank_sampah/view/admin/konversi/form_barang_widget.dart';
import 'package:bank_sampah/view/admin/konversi/form_user_widget.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:bank_sampah/view/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonversiPage extends StatelessWidget {
  KonversiPage({super.key});

  final SearchUserController searchController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BannerHomeAdminWidget(),
            const SizedBox(height: 24),
            Obx(() {
              return Stack(
                children: [
                  const Column(
                    children: [
                      SearchWidget(
                        hintText: "Cari NIK",
                      ),
                      FormUserWidget(),
                    ],
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
                                color:
                                    const Color(0xFF000000).withOpacity(0.25),
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
                              itemCount: searchController.searchResults.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                      searchController.searchResults[index]),
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
            const SearchWidget(
              hintText: "Cari Nama Barang",
              keyboardType: TextInputType.text,
              icon: Icon(Icons.search),
            ),
            const FormBarangWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ButtonWidget(
                  onPressed: () async {},
                  text: 'Konversi',
                  textColor: ColorNeutral.neutral100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
