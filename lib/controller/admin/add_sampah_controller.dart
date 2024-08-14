import 'dart:typed_data';

import 'package:bank_sampah/services/admin/tambah_sampah_service.dart';
import 'package:bank_sampah/view/admin/home/kelola_sampah/kelola_sampah_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class AddSampahController extends GetxController {
  var isTapped = false.obs;

  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  RxBool isLoadingAddSampah = false.obs;

  final errorMessageNamaSampah = Rxn<String>();
  final errorMessageDeskripsiSampah = Rxn<String>();
  final errorMessageNilaiPointSampah = Rxn<String>();

  TextEditingController namaSampahController = TextEditingController();
  TextEditingController deskripsiSampahController = TextEditingController();
  TextEditingController nilaiPointSampahController = TextEditingController();

  void setTapped(bool tapped) {
    isTapped.value = tapped;
  }

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

  void addSampah() async {
    //validate form
    validatorNamaSampah(namaSampahController.text);
    validatorDeskripsiSampah(deskripsiSampahController.text);
    validatorNilaiPointSampah(nilaiPointSampahController.text);

    //print value
    if (errorMessageNamaSampah.value != null ||
        errorMessageDeskripsiSampah.value != null ||
        errorMessageNilaiPointSampah.value != null ||
        imageFile.value == null) {
      Get.snackbar(
        'Error',
        'Seluruh Form Harus diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    //add data to firebase

    try {
      isLoadingAddSampah.value = true;
      // Upload image dan tambahkan barang
      await TambahSampahService()
          .uploadImageSampah(imageFile.value!)
          .then((imageUrl) {
        TambahSampahService().addSampah(
          imageUrl,
          namaSampahController.text,
          int.parse(nilaiPointSampahController.text),
          deskripsiSampahController.text,
        );
      });
      isLoadingAddSampah.value = false;

      // Tampilkan pesan sukses
      Get.snackbar(
        'Success',
        'Upload Menabung Sampah Berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(() => const KelolaSampahPage());
      clearFormAll();
    } on Exception catch (e) {
      // Tampilkan pesan error
      isLoadingAddSampah.value = false;

      Get.snackbar(
        'Error',
        'Gagal menambahkan barang (error: ${e.toString()})',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearFormAll() {
    namaSampahController.clear();
    deskripsiSampahController.clear();
    nilaiPointSampahController.clear();
    imageFile.value = null;
  }

  @override
  void dispose() {
    namaSampahController.dispose();
    deskripsiSampahController.dispose();
    nilaiPointSampahController.dispose();
    super.dispose();
  }
}
