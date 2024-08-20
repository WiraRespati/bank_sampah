import 'package:bank_sampah/services/admin/delete_sampah_service.dart';
import 'package:bank_sampah/services/admin/edit_sampah_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/sampah_model.dart';
import '../../services/admin/show_sampah_service.dart';
import '../../view/admin/home/kelola_sampah/kelola_sampah_page.dart';

class EditSampahController extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  var isLoading = false.obs;

  Rxn<List<SampahModel>> listSampah = Rxn<List<SampahModel>>([]);
  Rxn<SampahModel> sampah = Rxn<SampahModel>();

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

  void getAllSampah() async {
    try {
      final response = await ShowSampahService().getAllSampahData();
      if (response['status'] == 'success') {
        listSampah.value = response['sampah'];
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengambil data sampah (error: ${e.toString()})',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void setSampah() {
    namaSampahController.text = sampah.value!.name ?? '';
    deskripsiSampahController.text = sampah.value!.description ?? '';
    nilaiPointSampahController.text = sampah.value!.points.toString();
    imagePath!.value = sampah.value!.gambar ?? '';
  }

  void editSampah() async {
    isLoading.value = true;
    final response = await EditSampahService().editSampah(
      SampahModel(
        id: sampah.value!.id,
        name: namaSampahController.text,
        description: deskripsiSampahController.text,
        points: int.parse(nilaiPointSampahController.text),
        gambar: sampah.value!.gambar,
        createdAt: sampah.value!.createdAt,
      ),
      imageFile.value,
    );
    isLoading.value = false;
    if (response['status'] == 'success') {
      Get.offAll(() => const KelolaSampahPage());
      clearForm();
      Get.snackbar(
        'Success',
        'Berhasil mengedit sampah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Gagal mengedit sampah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void deleteSampah() async {
    isLoading.value = true;
    final response = await DeleteSampahService().deleteSampah(sampah.value!);
    isLoading.value = false;
    if (response['status'] == 'success') {
      isLoading.value = false;
      Get.offAll(() => const KelolaSampahPage());
      Get.snackbar(
        'Success',
        'Berhasil menghapus sampah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Gagal menghapus sampah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearForm() {
    namaSampahController.clear();
    deskripsiSampahController.clear();
    nilaiPointSampahController.clear();
    imagePath!.value = '';
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
