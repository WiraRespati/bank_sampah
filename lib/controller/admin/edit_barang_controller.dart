import 'dart:typed_data';
import 'package:bank_sampah/services/admin/edit_barang_service.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/kelola_barang_page.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/barang_model.dart';

class EditBarangController extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  Rxn<BarangModel> barang = Rxn<BarangModel>();

  final errorMessageNamaBarang = Rxn<String>();
  final errorMessageDeskripsiBarang = Rxn<String>();
  final errorMessageNilaiPoint = Rxn<String>();
  final errorMessageJumlahStok = Rxn<String>();

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController deskripsiBarangController = TextEditingController();
  TextEditingController nilaiPointController = TextEditingController();
  TextEditingController jumlahStokController = TextEditingController();

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

  void validatorDeskripsiBarang(String value) {
    if (value.isEmpty) {
      errorMessageDeskripsiBarang.value = "Deskripsi Barang tidak boleh kosong";
    } else {
      errorMessageDeskripsiBarang.value = null;
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
      errorMessageJumlahStok.value = "Jumlah Stok tidak boleh kosong";
    } else {
      errorMessageJumlahStok.value = null;
    }
  }

  void setBarang() {
    namaBarangController.text = barang.value!.name ?? '';
    deskripsiBarangController.text = barang.value!.description ?? '';
    nilaiPointController.text = barang.value!.price.toString();
    jumlahStokController.text = barang.value!.stock.toString();
    imagePath!.value = barang.value!.image ?? '';
  }

  void editBarang() async {
    final response = await EditBarangService().editBarang(
      BarangModel(
        id: barang.value!.id,
        name: namaBarangController.text,
        description: deskripsiBarangController.text,
        price: int.parse(nilaiPointController.text),
        stock: int.parse(jumlahStokController.text),
        image: barang.value!.image,
      ),
      imageFile.value,
    );
    if (response['status'] == 'success') {
      Get.offAll(() => const KelolaBarangPage());
      Get.snackbar(
        'Success',
        'Berhasil mengedit barang',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Gagal mengedit barang',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearData() {
    namaBarangController.clear();
    deskripsiBarangController.clear();
    nilaiPointController.clear();
    jumlahStokController.clear();
    imagePath!.value = '';
    imageFile.value = null;
  }

  @override
  void dispose() {
    namaBarangController.dispose();
    deskripsiBarangController.dispose();
    nilaiPointController.dispose();
    jumlahStokController.dispose();
    super.dispose();
  }
}
