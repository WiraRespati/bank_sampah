import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_sampah/controller/admin/edit_sampah_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadEditSampahWidget extends StatelessWidget {
  UploadEditSampahWidget({super.key});

  final EditSampahController sampahController = Get.put(
    EditSampahController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(
                "Foto Sampah",
                style: TextStyleCollection.bodyBold.copyWith(
                  color: ColorCollection.black,
                ),
                minFontSize: 16,
                maxFontSize: 18,
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                isDismissible: false,
                Container(
                  height: 205,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Foto Sampah",
                                style: TextStyleCollection.bodyBold.copyWith(
                                    color: ColorPrimary.primary100,
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close,
                                      size: 24,
                                      color: ColorPrimary.primary100)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 105,
                          decoration: BoxDecoration(
                            color: ColorNeutral.neutral50,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                  sampahController.onCameraView();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 13, right: 30, bottom: 17),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ambil Foto",
                                        style: TextStyleCollection.caption
                                            .copyWith(
                                                color: ColorPrimary.primary100,
                                                fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: 24,
                                        color: ColorPrimary.primary100,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: Divider(
                                  height: 1,
                                  color: ColorNeutral.neutral100,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  sampahController.onGalleryView();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 13, bottom: 13, left: 16, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pilih Foto",
                                        style: TextStyleCollection.caption
                                            .copyWith(
                                                color: ColorPrimary.primary100,
                                                fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.photo_outlined,
                                        size: 24,
                                        color: ColorPrimary.primary100,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: ColorCollection.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.25),
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                height: 324,
                width: 324,
                child: sampahController.imageFile.value != null
                    ? Image.file(
                        File(sampahController.imageFile.value!.path),
                        fit: BoxFit.cover,
                      )
                    : sampahController.sampah.value!.gambar != null
                        ? Image.network(
                            sampahController.sampah.value!.gambar!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(sampahController.imageFile.value!.path),
                            fit: BoxFit.cover,
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
