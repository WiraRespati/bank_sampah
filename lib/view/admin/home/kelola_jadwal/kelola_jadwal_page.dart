import 'package:bank_sampah/controller/admin/jadwal_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/alert_delete_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/item_jadwal_admin_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/tambah_jadwal_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaJadwalPage extends StatelessWidget {
  const KelolaJadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final JadwalController controller = Get.put(JadwalController());
    controller.fetchJadwalData();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const KelolaHeaderWidget(
                  title: "Kelola Jadwal Bank",
                ),
                TambahJadwalWidget(
                  onTap: () {
                    Get.to(() => const TambahJadwalPage());
                  },
                ),
                Obx(() {
                  if (controller.jadwalList.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada jadwal tersedia",
                        style: TextStyleCollection.bodyMedium.copyWith(
                          fontSize: 16,
                          color: ColorPrimary.primary100,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.jadwalList.length,
                    itemBuilder: (context, index) {
                      final jadwal = controller.jadwalList[index];
                      return ItemJadwalAdminWidget(
                        day: jadwal.day,
                        openTime: jadwal.openTime,
                        closedTime: jadwal.closedTime,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDeleteWidget(
                              title: 'Hapus Jadwal',
                              description:
                                  "Apakah Anda yakin ingin menghapus jadwal?",
                              onDelete: () {
                                controller.deleteJadwal(jadwal.id!);
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
          Obx(
            () {
              if (controller.isLoadingJadwalData.value) {
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
