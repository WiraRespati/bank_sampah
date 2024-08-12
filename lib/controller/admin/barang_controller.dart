import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BarangController extends GetxController {
  var isTapped = false.obs;

  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  final errorMessageNamaBarang = Rxn<String>();
  final errorMessageNilaiPoint = Rxn<String>();
  final errorMessageJumlahStok = Rxn<String>();

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController nilaiPointController = TextEditingController();
  TextEditingController jumlahStokController = TextEditingController();


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

  void validatorNamaBarang(String value) {
    if (value.isEmpty) {
      errorMessageNamaBarang.value = "Nama Barang tidak boleh kosong";
    } else {
      errorMessageNamaBarang.value = null;
    }
  }

  void validatorNilaiPoint(String value) {
    if (value.isEmpty) {
      errorMessageNilaiPoint.value = "Nilai Point tidak boleh kosong";
    } else {
      errorMessageNilaiPoint.value = null;
    }
  }
  void validatorJumlahStok(String value) {
    if (value.isEmpty) {
      errorMessageNilaiPoint.value = "Jumlah Stok tidak boleh kosong";
    } else {
      errorMessageNilaiPoint.value = null;
    }
  }

  @override
  void dispose() {
    namaBarangController.dispose();
    nilaiPointController.dispose();
    jumlahStokController.dispose();
    super.dispose();
  }
}
