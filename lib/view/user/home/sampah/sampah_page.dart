import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/user/home/item_home_widget.dart';
import 'package:bank_sampah/view/user/home/sampah/sampah_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampahPage extends StatelessWidget {
  const SampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditSampahController sampahController = Get.put(
      EditSampahController(),
    );
    sampahController.getAllSampah();
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SampahAppbar(),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                double childAspectRatio =
                    constraints.maxWidth > 600 ? 0.60 : 0.60;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () {
                      if (sampahController.listSampah.value?.isEmpty ?? true) {
                        return Center(
                          child: Text(
                            'Belum ada data sampah tersedia',
                            style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 16,
                              color: ColorPrimary.primary100,
                            ),
                          ),
                        );
                      } else {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: crossAxisCount == 4 ? 33 : 24,
                            childAspectRatio: childAspectRatio,
                          ),
                          itemCount:
                              sampahController.listSampah.value?.length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final sampah =
                                sampahController.listSampah.value?[index];
                            return Center(
                              child: ItemHomeWidget(
                                image: sampah?.gambar,
                                title: sampah?.name,
                                point: Helper.formatNumber(
                                    sampah!.points.toString()),
                                description: sampah.description,
                                date: Helper.formatTimestamp(sampah.createdAt),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
