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
            BannerHomeWidget(),
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
                            'Tukar Point',
                            style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 16,
                              color: ColorPrimary.primary100,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tabung Sampah',
                            style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 16,
                              color: ColorPrimary.primary100,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          riwayatController
                                      .listRiwayatKonversi.value?.isEmpty ??
                                  true
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height / 6,
                                    horizontal:
                                        MediaQuery.of(context).size.width / 8,
                                  ),
                                  child: Text(
                                    'Tidak ada riwayat Tukar Point',
                                    maxLines: 1,
                                    style:
                                        TextStyleCollection.bodyMedium.copyWith(
                                      fontSize: 16,
                                      color: ColorPrimary.primary100,
                                    ),
                                  ),
                                )
                              : ListView.builder(
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
                                      image: riwayatController
                                          .listRiwayatKonversi
                                          .value![index]
                                          .imageBarang,
                                      point: riwayatController
                                          .listRiwayatKonversi
                                          .value![index]
                                          .hargaBarang
                                          .toString(),
                                      title: riwayatController
                                          .listRiwayatKonversi
                                          .value![index]
                                          .deskripsiBarang!
                                          .split(' ')
                                          .first,
                                      simbol: '-',
                                    );
                                  },
                                ),
                          riwayatController
                                      .listRiwayatMenabung.value?.isEmpty ??
                                  true
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height / 6,
                                    horizontal:
                                        MediaQuery.of(context).size.width / 8,
                                  ),
                                  child: Text(
                                    'Belum ada riwayat menabung',
                                    maxLines: 1,
                                    style:
                                        TextStyleCollection.bodyMedium.copyWith(
                                      fontSize: 16,
                                      color: ColorPrimary.primary100,
                                    ),
                                  ),
                                )
                              : ListView.builder(
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
                                          .listRiwayatMenabung
                                          .value![index]
                                          .image,
                                      point: riwayatController
                                          .listRiwayatMenabung
                                          .value![index]
                                          .points
                                          .toString(),
                                      title: riwayatController
                                          .listRiwayatMenabung
                                          .value![index]
                                          .description!
                                          .split(' ')
                                          .first,
                                      simbol: '+',
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
