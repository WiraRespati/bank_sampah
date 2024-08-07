import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/user/home/banner_home_widget.dart';
import 'package:bank_sampah/view/user/home/item_home_widget.dart';
import 'package:bank_sampah/view/user/home/title_item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerHomeWidget(),
            TitleItemWidget(
              title: 'Sampah yang dapat ditabung',
              onPressed: () {},
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ItemHomeWidget();
                },
              ),
            ),
            TitleItemWidget(
              title: 'Barang yang dapat ditukar',
              onPressed: () {},
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ItemHomeWidget();
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
