// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/controller/user/riwayat_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/user/history/item_history_convert_widget.dart';
import 'package:bank_sampah/view/user/home/banner_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RiwayatController riwayatController = Get.put(RiwayatController());
    riwayatController.getAllRiwayatKonversi();
    riwayatController.getAllRiwayatMenabung();
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerHomeWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: ColorPrimary.primary100,
                      tabs: [
                        Tab(
                          child: Text(
                            'Tukar Koin',
                            style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 16,
                              color: ColorPrimary.primary100,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Kumpul Sampah',
                            style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 16,
                              color: ColorPrimary.primary100,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: riwayatController
                                    .listRiwayatKonversi.value?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return ItemHistoryConvertWidget(
                                date: Helper.formatTimestamp(
                                  riwayatController.listRiwayatKonversi
                                      .value![index].createdAt,
                                ),
                                description: riwayatController
                                    .listRiwayatKonversi
                                    .value![index]
                                    .deskripsiBarang,
                                image: riwayatController.listRiwayatKonversi
                                    .value![index].imageBarang,
                                point: riwayatController.listRiwayatKonversi
                                    .value![index].hargaBarang
                                    .toString(),
                                title: riwayatController.listRiwayatKonversi
                                    .value![index].deskripsiBarang!
                                    .split(' ')
                                    .first,
                              );
                            },
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: riwayatController
                                    .listRiwayatMenabung.value?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return ItemHistoryConvertWidget(
                                date: Helper.formatTimestamp(
                                  riwayatController.listRiwayatMenabung
                                      .value![index].createdAt,
                                ),
                                description: riwayatController
                                    .listRiwayatMenabung
                                    .value![index]
                                    .description,
                                image: riwayatController
                                    .listRiwayatMenabung.value![index].image,
                                point: riwayatController
                                    .listRiwayatMenabung.value![index].points
                                    .toString(),
                                title: riwayatController.listRiwayatMenabung
                                    .value![index].description!
                                    .split(' ')
                                    .first,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
