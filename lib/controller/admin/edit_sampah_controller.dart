import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class EditSampahController extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  final errorMessageNamaSampah = Rxn<String>();
  final errorMessageDeskripsiSampah = Rxn<String>();
  final errorMessageNilaiPointSampah = Rxn<String>();

  TextEditingController namaSampahController = TextEditingController();
  TextEditingController deskripsiSampahController = TextEditingController();
  TextEditingController nilaiPointSampahController = TextEditingController();

  void onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setImageFile(pickedFile);
      setImagePath(pickedFile.path);
    }
  }

  void setImageFile(XFile? value) {
    imageFile.value = value;
  }

  Future<List<int>> compressImage(Uint8List bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 2000000) return bytes;
    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];
    do {
      compressQuality -= 10;
      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );
      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }

  void setImagePath(String? value) {
    imagePath!.value = value!;
  }

  void onCameraView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setImageFile(pickedFile);
      setImagePath(pickedFile.path);
    }
  }

  void validatorNamaSampah(String value) {
    if (value.isEmpty) {
      errorMessageNamaSampah.value = "Nama Sampah tidak boleh kosong";
    } else {
      errorMessageNamaSampah.value = null;
    }
  }

  void validatorDeskripsiSampah(String value) {
    if (value.isEmpty) {
      errorMessageDeskripsiSampah.value = "Deskripsi Sampah tidak boleh kosong";
    } else {
      errorMessageDeskripsiSampah.value = null;
    }
  }

  void validatorNilaiPointSampah(String value) {
    if (value.isEmpty) {
      errorMessageNilaiPointSampah.value = "Nilai Point tidak boleh kosong";
    } else {
      errorMessageNilaiPointSampah.value = null;
    }
  }

  @override
  void dispose() {
    namaSampahController.dispose();
    deskripsiSampahController.dispose();
    nilaiPointSampahController.dispose();
    super.dispose();
  }
}
