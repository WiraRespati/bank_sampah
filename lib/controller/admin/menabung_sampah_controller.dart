import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MenabungSampahController extends GetxController {
  var isTapped = false.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  final errorMessageDeskripsi = Rxn<String>();
  final errorMessageNilaiPoint = Rxn<String>();

  TextEditingController deskripsiController = TextEditingController();
  TextEditingController nilaiPointController = TextEditingController();

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

  @override
  void dispose() {
    deskripsiController.dispose();
    nilaiPointController.dispose();
    super.dispose();
  }
}
