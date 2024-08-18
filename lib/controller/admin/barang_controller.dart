import 'package:bank_sampah/models/barang_model.dart';
import 'package:bank_sampah/services/admin/show_barang_services.dart';
import 'package:bank_sampah/services/admin/tambah_barang_service.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/kelola_barang_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BarangController extends GetxController {
  var isTapped = false.obs;

  Rxn<List<BarangModel>> listBarang = Rxn<List<BarangModel>>([]);

  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  RxBool isLoadingAddBarang = false.obs;
  RxBool isLoading = false.obs;

  final errorMessageNamaBarang = Rxn<String>();
  final errorMessageDeskripsiBarang = Rxn<String>();
  final errorMessageNilaiPoint = Rxn<String>();
  final errorMessageJumlahStok = Rxn<String>();

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController deskripsiBarangController = TextEditingController();
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

  void addBarang() async {
    // Validasi setiap field
    validatorNamaBarang(namaBarangController.text);
    validatorDeskripsiBarang(deskripsiBarangController.text);
    validatorNilaiPoint(nilaiPointController.text);
    validatorJumlahStok(jumlahStokController.text);

    // Cek apakah ada error message atau image file yang kosong
    if (errorMessageNamaBarang.value != null ||
        errorMessageDeskripsiBarang.value != null ||
        errorMessageNilaiPoint.value != null ||
        errorMessageJumlahStok.value != null ||
        imageFile.value == null) {
      Get.snackbar(
        'Error',
        'Seluruh Form Harus Diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoadingAddBarang.value = true;
      // Upload image dan tambahkan barang
      await TambahBarangService()
          .uploadImageBarang(imageFile.value!)
          .then((value) {
        TambahBarangService().addBarang(
          value,
          namaBarangController.text,
          int.parse(nilaiPointController.text),
          int.parse(jumlahStokController.text),
          deskripsiBarangController.text,
        );
      });
      isLoadingAddBarang.value = false;

      // Tampilkan pesan sukses
      Get.snackbar(
        'Success',
        'Upload Menabung Sampah Berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearData();
      Get.to(() => const KelolaBarangPage());
    } on Exception catch (e) {
      // Tampilkan pesan error
      isLoadingAddBarang.value = false;

      Get.snackbar(
        'Error',
        'Gagal menambahkan barang (error: ${e.toString()})',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void getAllBarang() async {
    isLoading.value = true;
    try {
      final response = await ShowBarangServices().getAllBarangData();
      listBarang.value = response['barang'];
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan barang (error: ${e.toString()})',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearData() {
    namaBarangController.clear();
    deskripsiBarangController.clear();
    nilaiPointController.clear();
    jumlahStokController.clear();
    imageFile.value = null;
    errorMessageNamaBarang.value = null;
    errorMessageDeskripsiBarang.value = null;
    errorMessageNilaiPoint.value = null;
    errorMessageJumlahStok.value = null;
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
