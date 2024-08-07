// ignore_for_file: deprecated_member_use

import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/user/history/item_history_convert_widget.dart';
import 'package:bank_sampah/view/user/home/banner_home_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return const ItemHistoryConvertWidget();
                            },
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return const ItemHistoryConvertWidget();
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
