import 'package:bank_sampah/services/admin/upload_pengumpulan_sampah_service.dart';
import 'package:bank_sampah/view/admin/bottom_navbar_admin/bottom_navbar_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MenabungSampahController extends GetxController {
  var isTapped = false.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;
  RxString nik = ''.obs;
  var isLoading = false.obs;

  final errorMessageDeskripsi = Rxn<String>();
  final errorMessageNilaiPoint = Rxn<String>();

  TextEditingController deskripsiController = TextEditingController();
  TextEditingController nilaiPointController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();

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

  void validatorNilaiPoint(String value) {
    if (value.isEmpty) {
      errorMessageNilaiPoint.value = "Nilai Point tidak boleh kosong";
    } else {
      errorMessageNilaiPoint.value = null;
    }
  }

  void validatorDeskripsi(String value) {
    if (value.isEmpty) {
      errorMessageDeskripsi.value = "Deskripsi tidak boleh kosong";
    } else {
      errorMessageDeskripsi.value = null;
    }
  }

  void upload() async {
    validatorDeskripsi(deskripsiController.text);
    validatorNilaiPoint(nilaiPointController.text);

    if (errorMessageDeskripsi.value != null ||
        errorMessageNilaiPoint.value != null ||
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

    isLoading.value = true;
    try {
      final imageUrl = await UploadPengumpulanSampahService()
          .uploadImagePengumpulanSampah(imageFile.value!);
      await UploadPengumpulanSampahService().addPengumpulanSampah(
        imageUrl,
        nik.value,
        deskripsiController.text,
        int.parse(nilaiPointController.text),
      );
      Get.snackbar(
        'Success',
        'Upload Menabung Sampah Berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearForm();
      Get.offAll(BottomNavbarAdmin());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengupload sampah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    deskripsiController.clear();
    nilaiPointController.clear();
    namaLengkapController.clear();
    imagePath!.value = '';
    imageFile.value = null;
  }

  @override
  void dispose() {
    deskripsiController.dispose();
    nilaiPointController.dispose();
    super.dispose();
  }
}
