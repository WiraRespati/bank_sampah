import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/utils/utils.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/edit_sampah/edit_sampah_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah/tambah_sampah_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/tambah_sampah_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/widget/item_admin_widget.dart';
import 'package:bank_sampah/view/widget/show_modal_buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaSampahPage extends StatelessWidget {
  const KelolaSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditSampahController editSampahController =
        Get.put(EditSampahController());
    editSampahController.getAllSampah();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const KelolaHeaderWidget(
              title: "Kelola Sampah",
            ),
            TambahSampahWidget(
              onTap: () {
                Get.to(() => TambahSampahPage());
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                double screenHeight = MediaQuery.of(context).size.height;
                double childAspectRatio = screenHeight > 800 ? 0.69 : 0.60;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () {
                      if (editSampahController.listSampah.value?.isEmpty ??
                          true) {
                        return Center(
                          child: Text('Belum ada data sampah tersedia',
                              style: TextStyleCollection.bodyMedium.copyWith(
                                fontSize: 16,
                                color: ColorPrimary.primary100,
                              )),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: crossAxisCount == 4 ? 33 : 24,
                            childAspectRatio: childAspectRatio,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              editSampahController.listSampah.value?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            final sampah =
                                editSampahController.listSampah.value![index];
                            return Center(
                              child: ItemAdminWidget(
                                buttonName: 'Edit',
                                image: sampah.gambar,
                                title: sampah.name,
                                point: sampah.points.toString(),
                                onPressed: () {
                                  Get.to(() => const EditSampahPage());
                                  editSampahController.sampah.value =
                                      editSampahController
                                          .listSampah.value![index];
                                },
                                onTapItem: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return ShowModalButtomWidget(
                                        title: sampah.name,
                                        image: sampah.gambar,
                                        point: Helper.formatNumber(
                                            sampah.points!.toString()),
                                        description: sampah.description,
                                        date: Helper.formatTimestamp(
                                            sampah.createdAt),
                                      );
                                    },
                                  );
                                },
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
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
